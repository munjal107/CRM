package com.vasy.crm.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;

public class JasperExporter {

    @Autowired
    JasperReport jasperReport;
    @Autowired
    JasperPrint jasperPrint;
    @Autowired
    OutputStream outputStream;
    @Autowired
    File file;
    @Autowired
    JRXlsExporter xlsExporter;

    static Connection connection = null;

    public void jasperExporterPDF(HashMap jasperParameter, String jrxmlpath, String fileName, HttpServletResponse response) throws IOException {

        try {

            outputStream = response.getOutputStream();
            jasperReport = JasperCompileManager.compileReport(jrxmlpath);

            jasperPrint = JasperFillManager.fillReport(jasperReport, jasperParameter, getConnectionFront());

            file = File.createTempFile("output.", ".pdf");

            response.setContentType("application/pdf");
            response.setHeader("Content-disposition", "inline; filename=" + fileName + ".pdf");


            JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }


    public static Connection getConnectionFront() throws ClassNotFoundException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

			/*String jdbcUrl = "jdbc:mysql://crmdb.cpb6nomi1ke6.ap-south-1.rds.amazonaws.com:3306/crm_demo?useSSL=false&user=munjal1997&password=root1997";
			connection = (Connection)DriverManager.getConnection(jdbcUrl);
			*/
            connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/crm_demo?useSSL=false", "root", "root");
            //connection = (Connection) DriverManager.getConnection("jdbc:mysql://crmdb.cpb6nomi1ke6.ap-south-1.rds.amazonaws.com:3306/crm_demo?useSSL=false","munjal1997","root1997");
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return connection;
    }
}
