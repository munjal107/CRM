package com.vasy.crm.repo.invoice;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vasy.crm.model.invoice.Invoice;

public interface InvoiceRepo extends JpaRepository<Invoice, Long> {


    //@Query(value="select Max(invoice_no) from invoice_tbl",nativeQuery=true)		//below query returns zero if table is empty
    @Query(value = "select COALESCE(MAX(invoice_no), 0)  from invoice_tbl", nativeQuery = true)
    public long findInvoiceNo();

    @Query(value = "select COALESCE(SUM(total_amount), 0)  from invoice_tbl", nativeQuery = true)
    public double findTotalProfit();


    @Query(value = "select COALESCE(SUM(total_amount), 0)  from invoice_tbl where created_on BETWEEN ?1 AND ?2", nativeQuery = true)
    public double findWeekTotalProfit(Date d1, Date d2);

    @Query(value = "SELECT  TRUNCATE(MAX(total),2) as total,DATE_FORMAT(created_on, \"%Y-%m-%d\") as created_on FROM (select sum(total_amount) as total, created_on from invoice_tbl where DATE(created_on)<=current_date and created_on>=current_date-15 group by DATE(created_on) union all SELECT 0 as total, m1 as created_on FROM (SELECT SUBDATE( NOW() , INTERVAL 14 DAY) + INTERVAL m DAY AS m1 FROM (select @rownum\\:=@rownum+1 as m from (select 1 union select 2 union select 3 union select 4) t1,(select 1 union select 2 union select 3 union select 4) t2,(select 1 union select 2 union select 3 union select 4) t3,(select 1 union select 2 union select 3 union select 4) t4,(select @rownum\\:=-1) t0 ) d1 ) d2 WHERE m1 <= now()  ) AS a group by DATE(created_on) order by created_on;", nativeQuery = true)
    List<Map<Double, String>> get15daySalesAll();

    ArrayList<Invoice> findByCreatedBy(String uname);

    ArrayList<Invoice> findByLeadId(long id);

}
