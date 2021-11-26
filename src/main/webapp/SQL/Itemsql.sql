

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

-- 설명은 이미지 테이블 외래키 참조(설명페이지에 들어갈거 사진으로)
create table t_item(
    item_code number(38) unique not null,
    item_title varchar2(200) not null,
    item_price number(38) not null,
    item_discount number(38),
    item_stock number (38) not null,
    item_thumbnail NUMBER not null,
    item_description NUMBER not null,
    item_cdate date
);


create sequence t_item_code_seq increment by 1 start with 1 nocache;

-- 아이템 <-> 이미지 테이블을 이어주는 썸네일 테이블 
create table t_item_thumbnail(
    item_code number(38) not null,
    image_code number(38) not null,
);