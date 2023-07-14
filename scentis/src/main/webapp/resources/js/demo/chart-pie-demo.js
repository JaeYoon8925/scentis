// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';


// 페이지가 로드 완료( document.ready() >> jQuery로 표현한 것 )되면 비동기 통신이 시작되도록 코드 작성

$(function () { // documeny.readt() >> jQuery로 표현한 것
  $.ajax({
    url: 'getAgeData',

    data : {
      name : program_nm
    },

    dataType: 'json',
    success: function (res) {
      console.log(res)

      var data = [];
      data.push(res.n10s_rt);
      data.push(res.n20s_rt);
      data.push(res.n30s_rt);
      data.push(res.n40s_rt);
      data.push(res.n50s_rt);
      data.push(res.n60s_above_rt);

      var label = ['10대', '20대', '30대', '40대', '50대', '60대'];

      // 5. 차트그리는 전체 코드를 함수로 만들기.
      makePieChart(data, label);
    },
    // 5) 실패했을 때 실행할 함수

    error: function () {
      console.log('getAgeData 실패');
    }
  })
})







function makePieChart(data, label) {
  // Pie Chart Example
  var ctx = document.getElementById("myPieChart");

  var myPieChart = new Chart(ctx, {

    type: 'doughnut',
    data: {
      // db에서 조회한 10~60대 이상
      labels: label,
      datasets: [{
        //data에 DB에서 조회한 값 가져오기
        data: data,
        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#4e73df', '#1cc88a', '#36b9cc'],
        hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#2e59d9', '#17a673', '#2c9faf'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: false
      },
      cutoutPercentage: 80,
    },
  });
};

