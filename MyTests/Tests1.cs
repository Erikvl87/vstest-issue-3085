using System.Drawing;
using Xunit;

namespace MyTests
{
	public class Tests1
	{
		private const string FontFamilyName = "Calibri";
		public static int FontSize = 11;

		[Fact]
		public void TestMethod1()
		{
			var graphics = Graphics.FromImage(new Bitmap(1, 1));
			var font = new Font(FontFamilyName, FontSize);
			var stringSize = graphics.MeasureString("measure me", font);
			graphics.Dispose();
		}
	}
}
