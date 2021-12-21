// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["6月", "7月", "8月", "9月", "10月", "11月"],
    datasets: [{
      label: "營業額",
      backgroundColor: "rgba(126, 107, 107,0.6)",
      borderColor: "rgba(2,117,216,1)",
      data: [4215, 5312, 6251, 27841, 9821, 1458],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          maxTicksLimit: 7
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
