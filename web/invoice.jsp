<%-- 
    Document   : invoice
    Created on : Jun 25, 2024, 4:31:06 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo.png">
        <style>
            body{
                margin-top:20px;
                background-color: #f7f7ff;
            }
            #invoice {
                padding: 0px;
            }

            .invoice {
                position: relative;
                background-color: #f2e7c3;
                min-height: 680px;
                padding: 15px
            }

            .invoice header {
                padding: 10px 0;
                margin-bottom: 20px;
                border-bottom: 1px solid #157ED2;
            }

            .invoice .company-details {
                text-align: right
            }

            .invoice .company-details .name {
                margin-top: 0;
                margin-bottom: 0
            }

            .invoice .contacts {
                margin-bottom: 20px
            }

            .invoice .invoice-to {
                text-align: left
            }

            .invoice .invoice-to .to {
                margin-top: 0;
                margin-bottom: 0
            }

            .invoice .invoice-details {
                text-align: right
            }

            .invoice .invoice-details .invoice-id {
                margin-top: 0;
                color: #0d6efd
            }

            .invoice main {
                padding-bottom: 50px
            }

            .invoice main .thanks {
                margin-top: -100px;
                font-size: 2em;
                margin-bottom: 50px
            }

            .invoice main .notices {
                padding-left: 6px;
                border-left: 6px solid #157ED2;
                background: #e7f2ff;
                padding: 10px;
            }

            .invoice main .notices .notice {
                font-size: 1.2em
            }

            .invoice table {
                width: 100%;
                border-collapse: collapse;
                border-spacing: 0;
                margin-bottom: 20px
            }

            .invoice table td,
            .invoice table th {
                padding: 15px;
                background: #eee;
                border-bottom: 1px solid #fff
            }

            .invoice table th {
                white-space: nowrap;
                font-weight: 400;
                font-size: 16px
            }

            .invoice table td h3 {
                margin: 0;
                font-weight: 400;
                color: #157ED2;
                font-size: 1.2em
            }

            .invoice table .qty,
            .invoice table .total,
            .invoice table .unit {
                text-align: right;
                font-size: 1.2em
            }

            .invoice table .no {
                color: #fff;
                font-size: 1.6em;
                background: #00CDFE;
            }

            .invoice table .unit {
                background: #ddd
            }

            .invoice table .total {
                background: #00CDFE;
                color: #fff
            }

            .invoice table tbody tr:last-child td {
                border: none
            }

            .invoice table tfoot td {
                background: 0 0;
                border-bottom: none;
                white-space: nowrap;
                text-align: right;
                padding: 10px 20px;
                font-size: 1.2em;
                border-top: 1px solid #aaa
            }

            .invoice table tfoot tr:first-child td {
                border-top: none
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #00CDFE;
                background-clip: border-box;
                border: 0px solid rgba(0, 0, 0, 0);
                border-radius: .25rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
            }

            .invoice table tfoot tr:last-child td {
                color: #157ED2;
                font-size: 1.4em;
                border-top: 1px solid #157ED2
            }

            .invoice table tfoot tr td:first-child {
                border: none
            }

            .invoice footer {
                width: 100%;
                text-align: center;
                color: #777;
                border-top: 1px solid #aaa;
                padding: 8px 0
            }

            @media print {
                .invoice {
                    font-size: 11px !important;
                    overflow: hidden !important
                }
                .invoice footer {
                    position: absolute;
                    bottom: 10px;
                    page-break-after: always
                }
                .invoice>div:last-child {
                    page-break-before: always
                }
            }

            .invoice main .notices {
                padding-left: 6px;
                border-left: 6px solid #157ED2;
                background: #00CDFE;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div id="invoice">
                        <div class="invoice overflow-auto">
                            <div style="min-width: 600px">
                                <header>
                                    <div class="row" style="display: flex;justify-content: space-between">
                                        <div class="logo"> <a href="home"> <img src="assets/images/logo.png" alt="logo" style="width: 55%;border-radius: 50%" > </a> </div>
                                        <div class="col company-details">
                                            <div class="col">
                                                <a href="home">
                                                    <img src="assets/images/logo-icon.png" width="80" alt="">
                                                </a>
                                            </div>
                                            <h2 class="name" style="color: #157ED2">
                                                    Sunshop
                                            </h2>
                                            <div>Hoa Lac, Thach That, VietNam</div>
                                            <div>(123) 456-789</div>
                                            <div>Sunshop@gmail.com</div>
                                        </div>
                                    </div>
                                </header>
                                <main>
                                    <c:set value="${sessionScope.customer}" var="cus"/>
                                    <c:set value="${requestScope.invoiceID}" var="id"/>
                                    <c:set value="${requestScope.invoiceDate}" var="date"/>
                                    <div class="row contacts">
                                        <div class="col invoice-to">
                                            <div class="text-gray-light">INVOICE TO:</div>
                                            <h2 class="to">${cus.fullName}</h2>
                                            <div class="address">Phone: ${cus.phoneNumber}</div>
                                            <div class="email">Email: ${cus.email}</div>
                                        </div>
                                        <div class="col invoice-details">
                                            <h1 class="invoice-id">INVOICE ${id}</h1>
                                            <div class="date">Date of Invoice: ${date}</div>
                                        </div>
                                    </div>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th class="text-left">PRODUCT</th>
                                                <th class="text-right">PRICE</th>
                                                <th class="text-right">QUANTITY</th>
                                                <th class="text-right">TOTAL</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="i" value="1" />
                                            <c:forEach items="${requestScope.invoicelist}" var="s" >
                                                <tr style="text-align: center">
                                                <td class="no">${i}</td>
                                                <c:set var="i" value="${i + 1}"/>
                                                <td class="text-left">${s.productName}</td>
                                                <td class="unit">$ ${s.price}</td>
                                                <td class="qty">${s.quantity}</td>
                                                <td class="total">$ ${s.total}</td>
                                            </tr>
                                            <c:set value="${subtotal + s.total}" var="subtotal"/>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="2"></td>
                                                <td colspan="2">SUBTOTAL</td>
                                                <td>$ ${subtotal}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"></td>
                                                <td colspan="2">TAX 0%</td>
                                                <td>$ ${subtotal}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"></td>
                                                <td colspan="2">GRAND TOTAL</td>
                                                <td>$ ${subtotal}</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <div class="thanks" style="font-weight: bold;color: green">Thank you!</div>
                                    
                                </main>
                            </div>
                            <!--DO NOT DELETE THIS div. IT is responsible for showing footer always at the bottom-->
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
