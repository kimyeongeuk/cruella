/**
 * Treeview (jquery)
 */

'use strict';

$(function () {
  var theme = $('html').hasClass('light-style') ? 'default' : 'default-dark',
    basicTree = $('#jstree-basic'),
    dragDrop = $('#jstree-drag-drop'),
    dragDrop2 = $('#jstree-drag-drop2');


  // 참조선
  // Drag Drop
  // --------------------------------------------------------------------
  if (dragDrop.length) {
    dragDrop.jstree({
      core: {
        themes: {
          name: theme
        },
        check_callback: true,
        data: [
          {
            text: '영업총괄팀',
            children: [
              {
                text: '박시우 점장',
                icon: 'ti ti-user'

              },
              {
                text: '김영욱 부장',
                icon: 'ti ti-user'
              }
            ]
          },
          {
            text: '인사팀',
            state: {
              opened: false
            },
            children: [

              {
                text: '이예빈 팀장',
                icon: 'ti ti-user'
              },
              {
                text: '김동규 대리',
                icon: 'ti ti-user'
              },
            ]
          },
          {
            text: '지원팀',
            state: {
              opened: false
            },
            children: [
              {
                text: '김유빈 팀장',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              }
            ]
          },
          {
            text: '남성브랜드',
            state: {
              opened: false
            },
            children: [
              {
                text: '강보람 팀장',
                icon: 'ti ti-user'
              },
            ]
          }

        ]
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
      }
    });
  }

  dragDrop.bind("move_node.jstree", function (e, d) {
    console.log(e); //event
    console.log(d); //node


    // 현재 드랍된 node 객체 가지고 db에 반영시켜주는 ajax 기술

  });







  // Drag Drop
  // 결재선 조직도
  // --------------------------------------------------------------------
  if (dragDrop2.length) {
    dragDrop2.jstree({
      core: {
        themes: {
          name: theme,
          
        },
        check_callback: true,
        data: [
          {
            text: '영업총괄팀',
            children: [
              {
                text: '박시우 점장',
                memName: '박시우',
                memNo:1,
                teamName: '영업총괄팀',

                icon: 'ti ti-user'

              },
              {
                text: '김영욱 부장',
                icon: 'ti ti-user'
              }
            ]
          },
          {
            text: '인사팀',
            state: {
              opened: false
            },
            children: [

              {
                text: '이예빈 팀장',
                icon: 'ti ti-user'
              },
              {
                text: '김동규 대리',
                icon: 'ti ti-user'
              },
            ]
          },
          {
            text: '지원팀',
            state: {
              opened: false
            },
            children: [
              {
                text: '김유빈 팀장',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              },
              {
                text: '황재운 대리',
                icon: 'ti ti-user'
              }
            ]
          },
          {
            text: '남성브랜드',
            state: {
              opened: false
            },
            children: [
              {
                text: '손흥민 팀장',
                icon: 'ti ti-user'
              },
            ]
          }

        ]
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


    let count = 0;
    // drag & drop external div
    $(document).on('dnd_stop.vakata', function (e, data) {
        //console.log('dnd_stop');
        var t = $(data.event.target); // drop된 위치의 요소 => 여기에 노드 정보를 append 시키면됨
        console.log(t);
        //t.text("떨궈짐");
        

        var node = data.data.origin.get_node(data.element); // {..., original:{text:xx, memNo:xx}, ..}
       
        if(t.closest('thead').hasClass('aa')){
          if(count == 0){

            t.closest("thead").html(
              '<tr style="height: 50px; border: 1px solid;">'
              +'<td style="width: 138px;">결재서</td>' 
              + '<td style="width: 150px;">'+ node.original.memName 
              + '<input type="hidden" value=' + node.original.memNo  +'>'+'</td>'
              + '<td style="width: 150px;">'+ node.original.teamName +'</td>'
              + '<td style="padding-left: 70px;">결재</td>'
              + '<td style="width: 153px; padding-left: 33px;"><i class="ti ti-trash"></i></td>'
            + '</tr>'
            );
  
          }else if(count>0){
            t.closest("thead").append(
              '<tr style="height: 50px; border: 1px solid;">'
              +'<td style="width: 138px;">결재서</td>' 
              + '<td style="width: 150px;">'+ node.original.memName 
              + '<input type="hidden" value=' + node.original.memNo + '></td>'
              + '<td style="width: 150px;">'+ node.original.teamName +'</td>'
              + '<td style="padding-left: 70px;">결재</td>'
              + '<td style="width: 153px; padding-left: 33px;"><i class="ti ti-trash"></i></td>'
            + '</tr>'
            );
  
            
          }
        
          
          count++;
        }

       
        console.log(count);

        
      });


  


  }

  dragDrop2.bind("move_node.jstree", function (e, d) {
    //console.log(e); //event
    //console.log(d); //node

    // 현재 드랍된 node 객체 가지고 db에 반영시켜주는 ajax 

    

  });




















  // Ajax Example
  // --------------------------------------------------------------------
  if (ajaxTree.length) {
    ajaxTree.jstree({
      core: {
        themes: {
          name: theme
        },
        data: {
          url: assetsPath + 'json/jstree-data.json',
          dataType: 'json',
          data: function (node) {
            return {
              id: node.id
            };
          }
        }
      },
      plugins: ['types', 'state'],
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
      }
    });
  }
});
