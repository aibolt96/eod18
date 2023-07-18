CREATE TABLE "public.sign_up" (
	"user_id" serial NOT NULL,
	"username" varchar(20) NOT NULL UNIQUE,
	"email" varchar(100) NOT NULL UNIQUE,
	"firstname" varchar(25) NOT NULL,
	"lastname" varchar(25) NOT NULL,
	"phone" varchar UNIQUE,
	CONSTRAINT "sign_up_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.recipes" (
	"recipe_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_name" varchar(50) NOT NULL,
	"recipe_desc" varchar(300) NOT NULL,
	"recipe_pic" TEXT(1000),
	CONSTRAINT "recipes_pk" PRIMARY KEY ("recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.comments" (
	"comment_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	"comment_text" varchar(200) NOT NULL,
	CONSTRAINT "comments_pk" PRIMARY KEY ("comment_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.comment-replies" (
	"reply_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"comment_id" integer NOT NULL,
	"reply_body" integer NOT NULL,
	CONSTRAINT "comment-replies_pk" PRIMARY KEY ("reply_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.grocery_cart" (
	"grocery_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	CONSTRAINT "grocery_cart_pk" PRIMARY KEY ("grocery_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.occasions" (
	"occasion_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	"occasion_desc" varchar(1000),
	"occasion_pic" TEXT(1000),
	CONSTRAINT "occasions_pk" PRIMARY KEY ("occasion_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.user_password" (
	"password_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "user_password_pk" PRIMARY KEY ("password_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ingredients" (
	"ingredients_id" serial NOT NULL,
	"ingredient_name" varchar NOT NULL,
	"ingredient_price" integer NOT NULL,
	CONSTRAINT "ingredients_pk" PRIMARY KEY ("ingredients_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.recipe_ingredients" (
	"rec_ing_id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	CONSTRAINT "recipe_ingredients_pk" PRIMARY KEY ("rec_ing_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "recipes" ADD CONSTRAINT "recipes_fk0" FOREIGN KEY ("user_id") REFERENCES "sign_up"("user_id");

ALTER TABLE "comments" ADD CONSTRAINT "comments_fk0" FOREIGN KEY ("user_id") REFERENCES "sign_up"("user_id");
ALTER TABLE "comments" ADD CONSTRAINT "comments_fk1" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");

ALTER TABLE "comment-replies" ADD CONSTRAINT "comment-replies_fk0" FOREIGN KEY ("user_id") REFERENCES "sign_up"("user_id");
ALTER TABLE "comment-replies" ADD CONSTRAINT "comment-replies_fk1" FOREIGN KEY ("comment_id") REFERENCES "comments"("comment_id");

ALTER TABLE "grocery_cart" ADD CONSTRAINT "grocery_cart_fk0" FOREIGN KEY ("user_id") REFERENCES "sign_up"("user_id");
ALTER TABLE "grocery_cart" ADD CONSTRAINT "grocery_cart_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("ingredients_id");

ALTER TABLE "occasions" ADD CONSTRAINT "occasions_fk0" FOREIGN KEY ("user_id") REFERENCES "sign_up"("user_id");
ALTER TABLE "occasions" ADD CONSTRAINT "occasions_fk1" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");

ALTER TABLE "user_password" ADD CONSTRAINT "user_password_fk0" FOREIGN KEY ("user_id") REFERENCES "sign_up"("user_id");


ALTER TABLE "recipe_ingredients" ADD CONSTRAINT "recipe_ingredients_fk0" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");
ALTER TABLE "recipe_ingredients" ADD CONSTRAINT "recipe_ingredients_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("ingredients_id");










