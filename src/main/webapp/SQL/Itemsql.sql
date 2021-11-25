
create table member1(
	mem_code number(38) unique not null /*unique 제약 조건은 중복값을 허용하지 않고 null은 허용*/ 
  , mem_id varchar2(20) primary key /*회원아이디*/
  , mem_pwd varchar2(20) not null /*회원비번*/
  , mem_name varchar2(50) not null /*회원이름*/
  , mem_zip1 varchar2(5) not null /*첫번째 우편번호 */
  , mem_zip2 varchar2(5)           /*두번째 우편번호 */
  , mem_addr1 varchar2(100) not null /*주소*/
  , mem_addr2 varchar2(100) not null /*나머지 주소 */
  , mem_tel varchar2(20) not null /*전번*/
  , mem_phone varchar2(20) not null /*폰번호 */
  , mem_email varchar2(100) not null /*전자우편 주소*/
  , mem_regdate date /*가입 날짜*/
  , mem_state number(10) /*가입회원 1, 탈퇴회원 2 */
  , mem_delcont varchar2(4000) /*탈퇴 사유 */
  , mem_deldate date /*탈퇴 날짜 */
);



create table t_image(
    image_code number(38) unique not null,
    image_name varchar2(200) not null,
    image_path varchar2(200) not null,
    image_size varchar2(200) not null,
    image_cdate date
);
drop table t_image;

create sequence t_image_code_seq increment by 1 start with 1 nocache;

commit;