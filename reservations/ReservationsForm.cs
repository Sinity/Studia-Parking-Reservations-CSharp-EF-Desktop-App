using System;
using System.ComponentModel;
using System.Linq;
using System.Windows.Forms;
using System.Data.Entity;

namespace Reservations {
    public partial class ReservationsForm : Form {
        private ReservationsModelContainer ReservationsContext;

        public ReservationsForm() {
            InitializeComponent();
            ReloadContext();
            InitDatePickerControls();
            SetCurrentControlSet(gridParkings);
            RefreshGrids();
        }

        private void ReloadContext() {
            if (ReservationsContext != null)
                ReservationsContext.Dispose();

            ReservationsContext = new ReservationsModelContainer();
            ReservationsContext.Parkings.Load();
            dataSourceReservationSystem.DataSource = ReservationsContext.Parkings.Local.ToBindingList();
        }

        private void InitDatePickerControls() {
            GenerateReservDateFrom.Value = GenerateReservDateTo.Value = DateTime.Now;
            GenerateReservTimeFrom.Value = DateTime.Now.Date;
            GenerateReservTimeTo.Value = GenerateReservTimeFrom.Value.AddHours(24).AddSeconds(-1);
        }


        private void RefreshGrids() {
            gridParkings.Refresh();
            gridParkingPlaces.Refresh();
            gridReservationSlots.Refresh();
        }

        private void SetCurrentControlSet(DataGridView grid) {
            ResetControls();
            bindingNavigator.BindingSource = (BindingSource)grid.DataSource;
            grid.Visible = true;

            if (grid == gridParkings) {
                panelOrg.Visible = true;
                Text += " - parkingi";
                buttonBack.Enabled = false;
                buttonNext.Text = "Miejsca parkingowe";
            } else if (grid == gridParkingPlaces) {
                panelOrg.Visible = true;
                Text += " - miejsca parkingowe";
                buttonBack.Text = "Parkingi";
                buttonNext.Text = "Sloty rezerwacji";
            } else if (grid == gridReservationSlots) {
                groupboxReserve.Visible = true;
                Text += " - sloty rezerwacji";
                buttonBack.Text = "Miejsca parkingowe";
                buttonNext.Enabled = false;
                bindingNavigator.AddNewItem.Enabled = false;
            }
        }

        private void ResetControls() {
            Text = "Zarządzanie rezerwacjami";
            buttonBack.Enabled = buttonNext.Enabled = true;
            buttonBack.Text = buttonNext.Text = "...";
            gridParkings.Visible = gridParkingPlaces.Visible = gridReservationSlots.Visible = false;
            groupboxReserve.Visible = panelOrg.Visible = false;
            bindingNavigator.AddNewItem.Enabled = true;
        }

        private void BackButton_Click(object sender, EventArgs e) {
            if (gridReservationSlots.Visible)
                SetCurrentControlSet(gridParkingPlaces);
            else if (gridParkingPlaces.Visible)
                SetCurrentControlSet(gridParkings);
        }

        private void NextButton_Click(object sender, EventArgs e) {
            if (gridParkings.Visible)
                SetCurrentControlSet(gridParkingPlaces);
            else if (gridParkingPlaces.Visible)
                SetCurrentControlSet(gridReservationSlots);
        }

        private void HandleRemovedEntities() {
            // remove ParkingPlaces when Parkings containing them are removed
            foreach (var parkingPlace in ReservationsContext.ParkingPlaces.Local.ToList())
                if (parkingPlace.Parking == null)
                    ReservationsContext.ParkingPlaces.Remove(parkingPlace);

            // can't remove ReservationSlots which are filled with Reservations for the future
            foreach (var rslot in ReservationsContext.ReservationSlots.Local.ToList()) {
                if (rslot.ParkingPlace == null) {
                    if (rslot.TimeTo >= DateTime.Now && rslot.Reservation != null) {
                        MessageBox.Show("Nie można zapisać zmian: został usunięty parking, miejsce parkingowe lub slot rezerwacji na który została wykonana rezerwacja realizowana w przyszłości.");
                        return;
                    }

                    ReservationsContext.ReservationSlots.Remove(rslot);
                }
            }
        }

        private void SaveToolStripButton_Click(object sender, EventArgs e) {
            HandleRemovedEntities();

            try {
                ReservationsContext.SaveChanges();
            }
            catch (Exception exception) {
                MessageBox.Show("Wystąpił wyjątek podczas próby zapisu danych: " + exception.ToString());
            }

            RefreshGrids();
        }

        private void ReloadButton_Click(object sender, EventArgs e) {
            ReloadContext();
            SetCurrentControlSet(gridParkings);
            RefreshGrids();
        }

        private void ReservationSlotGridView_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e) {
            // Parking name
            if (e.ColumnIndex == 0)
                e.Value = gridParkings.CurrentRow.Cells[1].Value;                

            try {
                var reservationSlot = ((ReservationSlot)gridReservationSlots.Rows[e.RowIndex].DataBoundItem);
                if (reservationSlot == null || reservationSlot.Reservation == null)
                    return;

                if (e.ColumnIndex == 3)
                    e.Value = reservationSlot.Reservation.TimeOfReservation;
                else if (e.ColumnIndex == 7)
                    e.Value = reservationSlot.Reservation.RegistrationNumber;
                else if (e.ColumnIndex == 8)
                    e.Value = reservationSlot.Reservation.Token;
            }
            catch (IndexOutOfRangeException) {
                // there's some internal .NET bug apparently, exception is thrown here after deleting row from datagrid.
                // exception is not thrown if prior to removal user switches the current row
                // checking rowcount & that everything in the chain is not null doesn't help.
                e.Value = "[błąd aplikacji]";
            }
        }

        private void ParkingPlaceGridView_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e) {
            if (e.RowIndex == gridParkingPlaces.RowCount - 1)
                return;

            // Parking name
            if (e.ColumnIndex == 0)
                e.Value = gridParkings.CurrentRow.Cells[1].Value;

            // current reservation
            if (e.ColumnIndex == 3) {
                e.Value = "[niedostępne]";

                try {
                    var parkingPlace = ((ParkingPlace)gridParkingPlaces.Rows[e.RowIndex].DataBoundItem);
                    if (parkingPlace == null)
                        return;

                    foreach (var reservationSlot in parkingPlace.ReservationSlots) {
                        if (DateTime.Now >= reservationSlot.TimeFrom && DateTime.Now <= reservationSlot.TimeTo) {
                            if (reservationSlot.Reservation != null)
                                e.Value = reservationSlot.Reservation.RegistrationNumber;
                            else
                                e.Value = "[niezarezerwowane]";
                            break;
                        }
                    }
                }
                catch (IndexOutOfRangeException) {
                    // there's some internal .NET bug apparently, exception is thrown here after deleting row from datagrid.
                    // exception is not thrown if prior to removal user switches the current row
                    // checking rowcount & that everything in the chain is not null doesn't help.
                    e.Value = "[błąd aplikacji]";
                }
            }
        }

       private void AddReservationsButton_Click(object sender, EventArgs e) {
            if (gridParkings.Visible)
                foreach (var parkingPlace in ((Parking)gridParkings.CurrentRow.DataBoundItem).ParkingPlaces)
                    AddReservationSlotsForParkingPlace(parkingPlace);
            else
                AddReservationSlotsForParkingPlace(((ParkingPlace)gridParkingPlaces.CurrentRow.DataBoundItem));

            RefreshGrids();
        }

        private void AddReservationSlotsForParkingPlace(ParkingPlace parkingPlace) {
            var currDate = GenerateReservDateFrom.Value.Date;
            while (currDate <= GenerateReservDateTo.Value.Date) {
                if ((checkboxMonday.Checked && currDate.DayOfWeek == DayOfWeek.Monday) ||
                        (checkboxTuesday.Checked && currDate.DayOfWeek == DayOfWeek.Tuesday) ||
                        (checkboxWednesday.Checked && currDate.DayOfWeek == DayOfWeek.Wednesday) ||
                        (checkboxThursday.Checked && currDate.DayOfWeek == DayOfWeek.Thursday) ||
                        (checkboxFriday.Checked && currDate.DayOfWeek == DayOfWeek.Friday) ||
                        (checkboxSaturday.Checked && currDate.DayOfWeek == DayOfWeek.Saturday) ||
                        (checkboxSunday.Checked && currDate.DayOfWeek == DayOfWeek.Sunday)) {
                    var interval = TimeSpan.FromMinutes((double)GenerateReservInterval.Value);

                    var currTime = GenerateReservTimeFrom.Value.TimeOfDay;
                    var nextTime = currTime + interval;
                    while (nextTime <= GenerateReservTimeTo.Value.TimeOfDay) {
                        parkingPlace.ReservationSlots.Add(new ReservationSlot {
                            ParkingPlace = parkingPlace,
                            Price = Decimal.Parse(textBoxPrice.Text),
                            TimeFrom = currDate + currTime,
                            TimeTo = currDate + nextTime
                        });

                        currTime = nextTime;
                        nextTime += interval;
                    }
                }

                currDate = currDate.AddDays(1);
            }
        }

        private string GenerateRandomLookingString(int length) {
            return Convert.ToBase64String(Guid.NewGuid().ToByteArray()).Substring(0, length);
        }

        private void AddReservationButton_Click(object sender, EventArgs e) {
            if (gridReservationSlots.SelectedRows.Count == 0) {
                MessageBox.Show("Nie zostały podświetlone żadne sloty rezerwacji.");
                return;
            }

            if (textBoxRegistratrionNumber.Text.Length == 0) {
                MessageBox.Show("Nie wpisano numeru rejestracyjnego.");
                return;
            }

            for (var i = 0; i < gridReservationSlots.SelectedRows.Count; i++) {
                if (((ReservationSlot)gridReservationSlots.SelectedRows[i].DataBoundItem).Reservation != null) {
                    MessageBox.Show("Istnieje już rezerwacja dla co najmniej jednego z podświetlonych slotów.");
                    return;
                }
            }

            var reservation = new Reservation {
                TimeOfReservation = DateTime.Now,
                Token = GenerateRandomLookingString(10),
                RegistrationNumber = textBoxRegistratrionNumber.Text
            };
            ReservationsContext.Reservations.Add(reservation);

            for (var i = 0; i < gridReservationSlots.SelectedRows.Count; i++)
                ((ReservationSlot)gridReservationSlots.SelectedRows[i].DataBoundItem).Reservation = reservation;

            RefreshGrids();
        }

        private void ReservationSlotGridView_VisibleChanged(object sender, EventArgs e) {
            gridReservationSlots.Sort(gridReservationSlots.Columns[4], ListSortDirection.Ascending);

            for (var i = 0; i < gridReservationSlots.Rows.Count; i++)
                if (((ReservationSlot)gridReservationSlots.Rows[i].DataBoundItem).TimeFrom.Date == DateTime.Now.Date || ((ReservationSlot)gridReservationSlots.Rows[i].DataBoundItem).TimeTo.Date == DateTime.Now.Date)
                    gridReservationSlots.CurrentCell = gridReservationSlots.Rows[i].Cells[0];
        }

        private bool IsValidPriceString(string priceString) {
            return Decimal.TryParse(priceString, out var price);
        }

        private void TextBoxPrice_Validating(object sender, CancelEventArgs e) {
            if (!IsValidPriceString(textBoxPrice.Text)) {
                MessageBox.Show("Cena zawiera znaki niedozwolone lub jest niewypełniona. Nie zostały dodane sloty rezerwacji.");
                e.Cancel = true;
            }
        }

        private void TextBoxPrice_KeyPress(object sender, KeyPressEventArgs e) {           
            e.Handled = !(char.IsControl(e.KeyChar) || IsValidPriceString(textBoxPrice.Text + e.KeyChar));
        }
    }
}
