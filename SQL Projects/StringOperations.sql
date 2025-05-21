Select upper('India') as upper_case;

Select lower('INDIA') as lower_case;

select character_length('India') as total_len;

select name, character_length(name) as total_len from emp_details;

select concat("India", " is" , " my Country!") as merged;

select ID, FirstName, concat(FirstName, " ", Age) as Name_Age from friends;

select reverse("India");

select reverse(FirstName) from Friends;

select replace("My Name is Koushik", "Koushik", "Karthik");

select length(("     India     "));
select length(ltrim("     India     "));
select length(rtrim("     India     "));
select length(trim("     India     "));

select position("fruit" in "orange is a fruit") as name;

select ascii("k");
select ascii('7');