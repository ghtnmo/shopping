

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

-- 설명&&썸네일 은 이미지 테이블 외래키 참조(설명페이지에 들어갈거 사진으로)
-- 외래키 설정 해줘야함
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


create table t_item_category(
    item_code number(38) not null,
    item_category varchar2(200) not null,
);

-- 설명 / 썸네일에 이미지파일명이 들어가도록 뷰 생성해놓음 
create or replace view v_item as    
    select rn,a.item_code,a.item_title,a.item_price,a.item_discount,a.item_stock,a.item_cdate,b.image_name as item_thumbnail,des as item_description 
    from 
        (select x.*,y.image_name as des,ROW_NUMBER() OVER(order by x.item_code desc) rn
        from t_item x 
            ,t_image y 
        where x.item_description = y.image_code
        ) a 
        ,t_image b 
    where a.item_thumbnail = b.image_code;


--5.0 만점의 리뷰 점수 부여가능
create table t_review (
    review_code number(38) unique not null,
    mem_code number(38) not null,
    item_code number(38) not null,
    review_rate number(2,1) not null,
    review_image number(38),
    review_detail number(38),
    review_cdate date
);


create sequence t_review_code_seq increment by 1 start with 1 nocache;

-- 아이템 리뷰 수 리턴해주는 오라클 함수 
CREATE OR REPLACE FUNCTION GET_REVIEW_COUNT(
    ITEM_CODE_ IN VARCHAR2
) 
    RETURN NUMBER AS
    res NUMBER(38);
BEGIN
  SELECT COUNT(*)
    INTO res
    FROM t_review
    WHERE item_code = ITEM_CODE_;
    RETURN res;
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END GET_REVIEW_COUNT;