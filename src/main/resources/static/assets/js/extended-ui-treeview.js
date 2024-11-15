/**
 * Treeview (jquery)
 */

'use strict';


function jstreeRendering(jstreeView, theme, nodeData){
	jstreeView.jstree({
      core: {
        themes: {
          name: theme,
        },
        check_callback: true,
        data: nodeData 
		
      },
	  
	  
	  
      plugins: ['types', 'dnd'],
      types: {
        default: {
          icon: 'ti ti-folder'
        },
        html: {
          icon: 'ti ti-brand-html5 text-danger'
        },
        css: {
          icon: 'ti ti-brand-css3 text-info'
        },
        img: {
          icon: 'ti ti-photo text-success'
        },
        js: {
          icon: 'ti ti-brand-javascript text-warning'
        }
      },

    });
}


$(function () {
  var theme = $('html').hasClass('light-style') ? 'default' : 'default-dark',
  dragDrop = $('#jstree-drag-drop'),
  dragDrop2 = $('#jstree-drag-drop2');
  
  
  $.ajax({
	url: '/cruella/app/jstreeList.do',
	async: false,
	success:function(list){
		
		console.log(list);
		
		let nodeData = [];
		
		for(let i=0; i<list.length; i++){ // 부서 순차접근을 위한 for문
			
			let deptObj = {
				text: list[i].deptName,
				state: {
	              opened: false
	            },
				children:[]
			};
			
			let memList = list[i].memList;
			
			for(let j=0; j<memList.length; j++){ // 해당 부서 내의 사원들 순차접근을 위한 for문
				let memObj = {
					text: memList[j].memName + " " + memList[j].posName,
				    memName: memList[j].memName,
					memNo: memList[j].memNo,
					teamName: list[i].deptName,
					icon: 'ti ti-user'
				};
				
				deptObj.children.push(memObj);
			}
			
			nodeData.push(deptObj);
			
		}
		
		
		
		jstreeRendering(dragDrop, theme,nodeData ); // 참조선 jstree 렌더링
		jstreeRendering(dragDrop2, theme,nodeData);// 결재선 jstree 렌더링
		
		
	}
	
  })
  
 
  
  
  


  // 참조선
  // Drag Drop
  // --------------------------------------------------------------------
  if (dragDrop.length) {
    


    let count = 0;
    // drag & drop external div
    $(document).on('dnd_stop.vakata.dragDrop', function (e, data) {
      //console.log('dnd_stop');
      var tt = $(data.event.target); // drop된 위치의 요소 => 여기에 노드 정보를 append 시키면됨
      console.log(tt);
      //t.text("떨궈짐");


      var node = data.data.origin.get_node(data.element); // {..., original:{text:xx, memNo:xx}, ..}

      if (tt.closest('tbody').hasClass('aa2')) { // closest : 드래그 시 가장 가까운 태그 찾음

        console.log(tt.closest('tbody'));


        // 중복 검사 (input value에서 memNo를 비교)
        var memNo = node.original.memNo;
        var isDuplicate = tt.closest('tbody').find('tr').toArray().some(function (row) {
          var existingMemNo = $(row).find('input[type="hidden"]').val(); // hidden input에서 memNo 가져오기
          return existingMemNo == memNo;
        });

        if (isDuplicate) {
          alert('이미 추가된 사용자입니다.');
          return; // 중복되면 추가하지 않음
        }


        if (count == 0) {

          tt.closest("tbody").html(

            '<tr style="height: 50px; border: 1px solid;">'
            + '<input type="hidden" value=' + node.original.memNo + '>' + '</td>'
            + '<td style="width: 52px;"></td>'
            + '<td style="width: 138px;">기안서</td>'
            + '<td style="width: 150px;">' + node.original.memName + '</td>'
            + '<td style="width: 150px;">' + node.original.teamName + '</td>'
            + '<td style="padding-left: 42px;">참조</td>'
            + '<td style="width: 118px;"><i class="ti ti-trash"></i></td>'
            + '</tr>'

          );

        } else if (count > 0) {
          tt.closest("tbody").append(


            '<tr style="height: 50px; border: 1px solid;">'
            + '<input type="hidden" value=' + node.original.memNo + '>' + '</td>'
            + '<td style="width: 52px;"></td>'
            + '<td style="width: 138px;">기안서</td>'
            + '<td style="width: 150px;">' + node.original.memName + '</td>'
            + '<td style="width: 150px;">' + node.original.teamName + '</td>'
            + '<td style="padding-left: 42px;">참조</td>'
            + '<td style="width: 118px;"><i class="ti ti-trash"></i></td>'
            + '</tr>'


          );


        }

        count++;
      }


      console.log(count);


      



    });



    
       // >> 버튼 클릭 시 선택된 노드 추가
       $('#move_button').on('click', function () {
        // 선택된 jstree 노드 가져오기
        var selectedNode = dragDrop.jstree('get_selected', true);
  
        // 선택된 노드가 있을 경우
        if (selectedNode.length > 0) {
          selectedNode.forEach(function (node) {
            // 중복 검사 (input value에서 memNo를 비교)
            var memNo = node.original.memNo;
            var isDuplicate = $('#drag_line_div2').find('tr').toArray().some(function (row) {
              var existingMemNo = $(row).find('input[type="hidden"]').val(); // hidden input에서 memNo 가져오기
              return existingMemNo == memNo;
            });
  
            if (isDuplicate) {
              alert('이미 추가된 사용자입니다.');
              return; // 중복되면 추가하지 않음
            }
  
            // 첫 번째 항목일 때 테이블 초기화
            if (count === 0) {
              $('#drag_line_div2').html(
                '<tr style="height: 50px; border: 1px solid;">'
                + '<input type="hidden" value=' + node.original.memNo + '>'
                + '<td style="width: 52px;"></td>'
                + '<td style="width: 138px;">기안서</td>'
                + '<td style="width: 150px;">' + node.original.memName + '</td>'
                + '<td style="width: 150px;">' + node.original.teamName + '</td>'
                + '<td style="padding-left: 42px;">참조</td>'
                + '<td style="width: 118px;"><i class="ti ti-trash"></i></td>'
                + '</tr>'
              );
            } else {
              // 두 번째 이후 항목은 추가
              $('#drag_line_div2').append(
                '<tr style="height: 50px; border: 1px solid;">'
                + '<input type="hidden" value=' + node.original.memNo + '>'
                + '<td style="width: 52px;"></td>'
                + '<td style="width: 138px;">기안서</td>'
                + '<td style="width: 150px;">' + node.original.memName + '</td>'
                + '<td style="width: 150px;">' + node.original.teamName + '</td>'
                + '<td style="padding-left: 42px;">참조</td>'
                + '<td style="width: 118px;"><i class="ti ti-trash"></i></td>'
                + '</tr>'
              );
            }
  
            count++; // 카운트 증가
          });
        }
      });

    // 삭제
    $(document).on('click', '.aa2 .ti-trash', function () {
      var tr = $(this).closest('tr'); // 현재 클릭한 아이콘이 속한 tr 요소를 찾음
      tr.remove(); // 해당 tr 요소 삭제
      count--; // 삭제 후 카운트 감소 
      console.log(count);

      if (count === 0) {
        var emptyRow = '<tr style="height: 50px;">'
                     + '<td><span style="color: #aea9a9;">드래그하여 추가할 수 있습니다.</span></td>'
                     + '</tr>';
        $('.aa2').append(emptyRow); 
      }


      
    });







  }

  dragDrop.bind("move_node.jstree", function (e, d) {
    console.log(e); //event
    console.log(d); //node


    // 현재 드랍된 node 객체 가지고 db에 반영시켜주는 ajax 기술

  });















  // 결재선 조직도
  // Drag Drop
  // --------------------------------------------------------------------
  
  
 
  
  
  
  
  if (dragDrop2.length) {
    


    let countDnd = 0; // 추가된 데이터를 세기 위한 변수
    let orderCount = 0; // 결재선 순서를 세기 위한 변수??
    
    $(document).on('dnd_stop.vakata.dragDrop2', function (e, data) {
		
		console.log('dnd_stop 작동됨');
      var t = $(data.event.target); // drop된 위치의 요소 => 여기에 노드 정보를 append 시키면됨
		console.log(t);

      var node = data.data.origin.get_node(data.element); // {..., original:{text:xx, memNo:xx}, ..}

	  

      if (t.closest('tbody').hasClass('aa')) { // closest : 드래그 시 가장 가까운 태그 찾음

        // 중복 검사 (input value에서 memNo를 비교)
        var memNo = node.original.memNo;
		console.log('현재 옮겨지는 노드의 memNo', memNo);
        var isDuplicate = t.closest('tbody').find('tr').toArray().some(function (row) {
          var existingMemNo = $(row).find('input[type="hidden"]').val(); // hidden input에서 memNo 가져오기
		  console.log('현재 결재선에 등록된 memNo', existingMemNo);
          return existingMemNo == memNo;
        });
		
		console.log(isDuplicate);

        if (isDuplicate) {
          alert('이미 추가된 사용자입니다.');
          return; // 중복되면 추가하지 않음
        }


        if (countDnd >= 3) {
          alert('더이상 추가할 수 없습니다');
          return; // 3개 이상일 경우 함수 종료
        }

        if (countDnd == 0) {

          t.closest("tbody").html(
            '<tr style="height: 50px; border: 1px solid;">'
            + '<td style="width: 138px;">결재서</td>'
            + '<td style="width: 150px;">' + node.original.memName
            + '<input type="hidden" value=' + node.original.memNo + '>' + '</td>'
            + '<td style="width: 150px;">' + node.original.teamName + '</td>'
            + '<td style="padding-left: 70px;">결재</td>'
            + '<td style="width: 153px; padding-left: 33px;"><i class="ti ti-trash"></i></td>'
            // + '<input type="hidden" value="' +  orderCount++ + '>'
            + '</tr>'
          );

          

        } else if (countDnd > 0) {
          t.closest("tbody").append(
            '<tr style="height: 50px; border: 1px solid;">'
            + '<td style="width: 138px;">결재서</td>'
            + '<td style="width: 150px;">' + node.original.memName
            + '<input type="hidden" value=' + node.original.memNo + '></td>'
            + '<td style="width: 150px;">' + node.original.teamName + '</td>'
            + '<td style="padding-left: 70px;">결재</td>'
            + '<td style="width: 153px; padding-left: 33px;"><i class="ti ti-trash"></i></td>'
            // + '<input type="hidden" value="' +  orderCount++ + '>'
            + '</tr>'
          );


        }

        countDnd++;

      }


    });



     // >> 버튼 클릭 시 선택된 노드 추가
     $('#move_button2').on('click', function () {
      // 선택된 jstree 노드 가져오기
      var selectedNode = dragDrop2.jstree('get_selected', true);

      // 선택된 노드가 있을 경우
      if (selectedNode.length > 0) {
        selectedNode.forEach(function (node) {
          // 중복 검사 (input value에서 memNo를 비교)
          var memNo = node.original.memNo;
          var isDuplicate = $('#drag_line_div').find('tr').toArray().some(function (row) {
            var existingMemNo = $(row).find('input[type="hidden"]').val(); // hidden input에서 memNo 가져오기
            return existingMemNo == memNo;
          });

          if (isDuplicate) {
            alert('이미 추가된 사용자입니다.');
            return; // 중복되면 추가하지 않음
          }

          if (countDnd >= 3) {
            alert('더이상 추가할 수 없습니다');
            return; // 3개 이상일 경우 함수 종료
          }
  

          // 첫 번째 항목일 때 테이블 초기화
          if (countDnd === 0) {
            $('#drag_line_div').html(
              '<tr style="height: 50px; border: 1px solid;">'
              + '<td style="width: 138px;">결재서</td>'
              + '<td style="width: 150px;">' + node.original.memName
              + '<input type="hidden" value=' + node.original.memNo + '></td>'
              + '<td style="width: 150px;">' + node.original.teamName + '</td>'
              + '<td style="padding-left: 70px;">결재</td>'
              + '<td style="width: 153px; padding-left: 33px;"><i class="ti ti-trash"></i></td>'
              + '</tr>'
            );
          } else {
            // 두 번째 이후 항목은 추가
            $('#drag_line_div').append(
              '<tr style="height: 50px; border: 1px solid;">'
            + '<td style="width: 138px;">결재서</td>'
            + '<td style="width: 150px;" class="mem_name">' + node.original.memName
            + '<input type="hidden" value=' + node.original.memNo + '></td>'
            + '<td style="width: 150px;">' + node.original.teamName + '</td>'
            + '<td style="padding-left: 70px;">결재</td>'
            + '<td style="width: 153px; padding-left: 33px;"><i class="ti ti-trash"></i></td>'
            + '</tr>'
            );
          }

          countDnd++; // 카운트 증가
        });
      }
    });





    // 삭제
    $(document).on('click', '.aa .ti-trash', function () {
      var tr = $(this).closest('tr'); // 현재 클릭한 아이콘이 속한 tr 요소를 찾음
      tr.remove(); // 해당 tr 요소 삭제
      countDnd--; // 삭제 후 카운트 감소 
      console.log(countDnd);

      if (countDnd === 0) {
        var emptyRow = '<tr style="height: 50px;">'
                     + '<td><span style="color: #aea9a9;">드래그하여 추가할 수 있습니다.</span></td>'
                     + '</tr>';
        $('.aa').append(emptyRow); // tbody에 추가
      }


      
    });



  }

  dragDrop2.bind("move_node.jstree", function (e, d) {
    //console.log(e); //event
    //console.log(d); //node

    



  });




  // --------------------------------------------------------------------------------------

    // 취소버튼
  $(document).on('click', '#app_close_btn', function() {
    // 드래그하여 추가된 데이터 초기화
    $('.aa2').html('<tr style="height: 50px;">'
                   + '<td><span style="color: #aea9a9;">드래그하여 추가할 수 있습니다.</span></td>'
                   + '</tr>');
  
    // 클릭하여 추가된 데이터 초기화
    $('.aa').html('<tr style="height: 50px;">'
                  + '<td><span style="color: #aea9a9;">드래그하여 추가할 수 있습니다.</span></td>'
                  + '</tr>');
  
    // 카운트 리셋 
    count = 0;  
    countDnd = 0;  
  });







  

  $(document).on('click','#app_success_btn', function(){



    $('.app_line_div').html(
      '<span class="line_title"><b>결재선</b></span>'
      +'<span class="line_user">'
       + '<span>직급</span>'
        +'<span class="signLine">이름</span>'
        +'<span class="sign_date">결재일</span>'
      +'</span>'
    );



    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1; // 월은 0부터 시작하므로 +1
    var day = today.getDate();
    var count = 0;

    month = month < 10 ? '0' + month : month;
    day = day < 10 ? '0' + day : day;

    var formatDate = year + '/' + month + '/' + day;

     
     var countLevel = 1; // 순서지정

     $('#drag_line_div tr').each(function() {
      // 각 row에서 필요한 데이터 가져오기
      var memNo = $(this).find('input[type="hidden"]').val();
      var memName = $(this).find('td').eq(1).text().trim(); // 두 번째 td (memName)
      var teamName = $(this).find('td').eq(2).text().trim(); // 세 번째 td (teamName)

      
      
       
        
        var div = '<span class="line_user">'
                + '<span>' + teamName + '</span>'
                + '<span class="signLine">' + memName + '</span>'
                + '<span>' + formatDate + '</span>'
                + '<input type="hidden" value="' + memNo + '">'
                + '<input type="hidden" value="' + countLevel + '">'
                + '</span>';
        
        
      if($('#drag_line_div tr').length > 1){
        
        $('.app_line_div').append(div);
		
        countLevel++;
      }else if($('#drag_line_div tr').length == 1){
		$('.app_line_div').html(div);
      	
		countLevel++;
	  }

      


  });

  


  })















});
