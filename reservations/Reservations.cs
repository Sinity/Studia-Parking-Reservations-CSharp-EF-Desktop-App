using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Reservations {
    public partial class Parking {
        public override string ToString() {
            return Name;
        }
    }

    public partial class ParkingPlace {
        public override string ToString() {
            return Description;
        }
    }

    static class Program {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main() {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new ReservationsForm());
        }
    }
}
