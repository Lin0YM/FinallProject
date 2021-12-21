// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["寵物專區", "保健醫用", "日常百貨", "生活家電", "餐廚用具", "銀髮保健"],
    datasets: [{
      data: [12.21, 15.58, 11.25, 8.32, 12, 50],
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#ffc107', '#28a745'],
    }],
  },
});
