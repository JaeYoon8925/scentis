// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// vs코드에서 수정 후에 반드시 ctrl+s로 저장하기.
// eclipse로 돌아가서 해당하는 파일을 다시 열어주기,

// 링크 클릭, 버튼 클릭, 페이지 변환이 일어나면서 데이터 응답 >> 동기통신.

// 비동기 통신 << db에서 데이터를 조회해와서 차트를 그리기.
//  : jquery 문법 $.ajax()
// 문법
// $.ajax() 의 매개변수는 자바 스크립트의 객체 {}



$(function () {

  $.ajax({
    // 1) 어디로 요청을 보내야하는가
    url: 'getMonthData',
    // 2) 보내줄 값이 있는가

    // data: {
    //   program_nm: $("#program_nm").val()
    // },

    data : {
      program_nm : program_nm
    },


    // 3) 받아올 결과값의 자료형 지정.
    dataType: 'json',
    // 4) 성공했을 때 실행할 함수
    success: function (res) {
      console.log(res)
      // res => 배열 -> 객체들이 존재
      // res의 0번 인덱스에 있는 객체안에 wtchng_rt를 console에 출력하기.
      console.log(res[0].wtchng_rt)
      console.log(res[0].brdcst_de)

      // 1. labels에 들어갈 수 있는 배열을 하나 생성
      var monthData = [];

      // 2. 배열에 res 안에 들어있는 brdcst_de 라는 데이터를 하나씩 추가 (배열의 길이만큼 반복)
      for (var i = 0; i < res.length; i++) {
        //조건에 해당하는 값을 배열에 순차대로 넣기
        console.log(res.length);
        monthData.push(res[i].brdcst_de);
      }

      // 3. data에 들어갈 수 있는 배열을 하나 생성
      var wtchngData = [];

      // 4. 배열에 res안에 들어있는 wtchng_rt라는 데이터를 하나씩 추가.
      for (var i = 0; i < res.length; i++) {
        //조건에 해당하는 값을 배열에 순차대로 넣기
        wtchngData.push(res[i].wtchng_rt);
      }

      // 5. 차트그리는 전체 코드를 함수로 만들고, 함수를 사용해서 배열 2개를 매개변수로 넘기기.
      makeAreaChart(monthData, wtchngData);

    },
    // 5) 실패했을 때 실행항 함수
    error: function () {
      console.log('실패');
    }

  })



})






function makeAreaChart(monthData, wtchngData) {

  var ctx = document.getElementById("myAreaChart");

  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      // x축 라벨 수정. (db에서 조회한 값으로)
      labels: monthData,
      datasets: [{
        label: "Earnings",
        lineTension: 0.3,
        backgroundColor: "rgba(78, 115, 223, 0.05)",
        borderColor: "rgba(78, 115, 223, 1)",
        pointRadius: 3,
        pointBackgroundColor: "rgba(78, 115, 223, 1)",
        pointBorderColor: "rgba(78, 115, 223, 1)",
        pointHoverRadius: 3,
        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
        pointHitRadius: 10,
        pointBorderWidth: 2,
        // data에 DB에서 월별 전체 시청률 조회한 값 가져오기
        data: wtchngData,
      }],
    },
    options: {
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 10,
          right: 25,
          top: 25,
          bottom: 0
        }
      },
      scales: {
        xAxes: [{
          time: {
            unit: 'date'
          },
          gridLines: {
            display: false,
            drawBorder: false
          },
          ticks: {
            maxTicksLimit: 7
          }
        }],
        yAxes: [{
          ticks: {
            maxTicksLimit: 5,
            padding: 10,
          },
          gridLines: {
            color: "rgb(234, 236, 244)",
            zeroLineColor: "rgb(234, 236, 244)",
            drawBorder: false,
            borderDash: [2],
            zeroLineBorderDash: [2]
          }
        }],
      },
      legend: {
        display: false
      },
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        titleMarginBottom: 10,
        titleFontColor: '#6e707e',
        titleFontSize: 14,
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        intersect: false,
        mode: 'index',
        caretPadding: 10,
      }
    }
  });

}
