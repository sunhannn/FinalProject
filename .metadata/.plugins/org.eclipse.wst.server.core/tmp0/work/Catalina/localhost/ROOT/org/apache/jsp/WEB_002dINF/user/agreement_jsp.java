/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.74
 * Generated at: 2023-05-09 10:36:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class agreement_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style>\r\n");
      out.write("	* {\r\n");
      out.write("  box-sizing: border-box;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html,\r\n");
      out.write("body {\r\n");
      out.write("  height: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("body {\r\n");
      out.write("  display: flex;\r\n");
      out.write("  margin: 0;\r\n");
      out.write("  background-color: #f5f6f7;\r\n");
      out.write("  font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen,\r\n");
      out.write("    Ubuntu, Cantarell, \"Open Sans\", \"Helvetica Neue\", sans-serif;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("ul {\r\n");
      out.write("  list-style: none;\r\n");
      out.write("  padding: 0;\r\n");
      out.write("  margin: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".wrap {\r\n");
      out.write("  margin: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".wrap .logo {\r\n");
      out.write("  text-align: center;\r\n");
      out.write("  margin-bottom: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".wrap .logo h1 {\r\n");
      out.write("  margin: 0;\r\n");
      out.write("  font-size: 50px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".wrap .contents {\r\n");
      out.write("  padding: 50px;\r\n");
      out.write("  background-color: #ffffff;\r\n");
      out.write("  border: 1px solid #dadada;\r\n");
      out.write("  border-radius: 5px;\r\n");
      out.write("  box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#form__wrap {\r\n");
      out.write("  margin: 0 auto;\r\n");
      out.write("  width: 460px;\r\n");
      out.write("  font-size: 14px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#form__wrap .terms__check__all {\r\n");
      out.write("  display: flex;\r\n");
      out.write("  margin-bottom: 35px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#form__wrap .terms__check__all label {\r\n");
      out.write("  margin-left: 3px;\r\n");
      out.write("  text-decoration: underline;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".terms__list .terms__box {\r\n");
      out.write("  margin: 20px 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".contents label {\r\n");
      out.write("  font-weight: 700;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("label.required::after {\r\n");
      out.write("  margin-left: 4px;\r\n");
      out.write("  font-size: 13px;\r\n");
      out.write("  font-weight: 400;\r\n");
      out.write("  line-height: 24px;\r\n");
      out.write("  color: #0086ff;\r\n");
      out.write("  content: \"(필수)\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".terms__list .terms__content {\r\n");
      out.write("  height: 88px;\r\n");
      out.write("  overflow: auto;\r\n");
      out.write("  margin-top: 8px;\r\n");
      out.write("  padding: 12px;\r\n");
      out.write("  border: 1px solid #dadada;\r\n");
      out.write("  background: #fff;\r\n");
      out.write("  font-size: 12px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".next-button {\r\n");
      out.write("  width: 100%;\r\n");
      out.write("  height: 40px;\r\n");
      out.write("  outline: none;\r\n");
      out.write("  cursor: pointer;\r\n");
      out.write("  background-color: #242222;\r\n");
      out.write("  color: #ffffff;\r\n");
      out.write("  border: none;\r\n");
      out.write("  border-radius: 5px;\r\n");
      out.write("  transition-duration: 0.2s;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".next-button:hover:enabled {\r\n");
      out.write("  background-color: #a3a2a2;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".next-button:disabled {\r\n");
      out.write("  opacity: 0.2;\r\n");
      out.write("  cursor: not-allowed;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media (max-width: 768px) {\r\n");
      out.write("  .wrap {\r\n");
      out.write("    min-width: 280px;\r\n");
      out.write("    padding: 20px;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  #form__wrap {\r\n");
      out.write("    max-width: 460px;\r\n");
      out.write("    width: auto;\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("	\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"wrap\">\r\n");
      out.write("      <div class=\"logo\"><img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/front/ggulTiper.png\"></div>\r\n");
      out.write("      <div class=\"contents\">\r\n");
      out.write("        <form action=\"/joinBtn\" method=\"POST\" id=\"form__wrap\">\r\n");
      out.write("          <div class=\"terms__check__all\">\r\n");
      out.write("            <input type=\"checkbox\" name=\"checkAll\" id=\"checkAll\">\r\n");
      out.write("            <label for=\"checkAll\"\r\n");
      out.write("              >꿀TIPer 이용약관, 개인정보 수집 및 이용, 프로모션 정보\r\n");
      out.write("              수신(선택)에<br />모두 동의합니다.</label\r\n");
      out.write("            >\r\n");
      out.write("          </div>\r\n");
      out.write("          <ul class=\"terms__list\">\r\n");
      out.write("            <li class=\"terms__box\">\r\n");
      out.write("              <div class=\"input__check\">\r\n");
      out.write("                <input type=\"checkbox\" name=\"agreement\" id=\"termsOfService\" value=\"termsOfService\" required>\r\n");
      out.write("                <label for=\"termsOfService\" class=\"required\">꿀Tiper 이용약관 동의</label\r\n");
      out.write("                >\r\n");
      out.write("              </div>\r\n");
      out.write("              <div class=\"terms__content\">\r\n");
      out.write("                여러분을 환영합니다. 꿀Tiper 서비스 및 제품(이하 ‘서비스’)을 이용해\r\n");
      out.write("                주셔서 감사합니다. 본 약관은 다양한 꿀Tiper 서비스의 이용과 관련하여\r\n");
      out.write("                꿀Tiper 서비스를 제공하는 꿀Tiper 주식회사(이하 ‘꿀Tiper’)와 이를 이용하는\r\n");
      out.write("                꿀Tiper 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,\r\n");
      out.write("                아울러 여러분의 꿀Tiper 서비스 이용에 도움이 될 수 있는 유익한\r\n");
      out.write("                정보를 포함하고 있습니다. 꿀Tiper 서비스를 이용하시거나 꿀Tiper 서비스\r\n");
      out.write("                회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을\r\n");
      out.write("                확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐\r\n");
      out.write("                주시기 바랍니다.\r\n");
      out.write("              </div>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"terms__box\">\r\n");
      out.write("              <div class=\"input__check\">\r\n");
      out.write("                <input type=\"checkbox\" name=\"agreement\" id=\"privacyPolicy\" value=\"privacyPolicy\" required>\r\n");
      out.write("                <label for=\"privacyPolicy\" class=\"required\">개인정보 수집 및 이용 동의</label>\r\n");
      out.write("              </div>\r\n");
      out.write("              <div class=\"terms__content\">\r\n");
      out.write("                개인정보보호법에 따라 꿀Tiper에 회원가입 신청하시는 분께 수집하는\r\n");
      out.write("                개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및\r\n");
      out.write("                이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내\r\n");
      out.write("                드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.1. 수집하는\r\n");
      out.write("                개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등\r\n");
      out.write("                대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다.\r\n");
      out.write("                이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제\r\n");
      out.write("                서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스\r\n");
      out.write("                이용을 위해 필요한 최소한의 개인정보를 수집합니다.\r\n");
      out.write("              </div>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"terms__box\">\r\n");
      out.write("              <div class=\"input__check\">\r\n");
      out.write("                <input type=\"checkbox\" name=\"agreement\" id=\"allowPromotions\" value=\"allowPromotions\">\r\n");
      out.write("                <label for=\"allowPromotions\">프로모션 정보 수신 동의</label>\r\n");
      out.write("              </div>\r\n");
      out.write("              <div class=\"terms__content\">\r\n");
      out.write("                꿀Tiper에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(꿀Tiper앱\r\n");
      out.write("                알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도\r\n");
      out.write("                회원 체계로 운영하거나 꿀Tiper 가입 이후 추가 가입하여 이용하는\r\n");
      out.write("                서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수\r\n");
      out.write("                있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를\r\n");
      out.write("                받습니다.\r\n");
      out.write("              </div>\r\n");
      out.write("            </li>\r\n");
      out.write("          </ul>\r\n");
      out.write("          <button type=\"submit\" class=\"next-button\" disabled>확인</button>\r\n");
      out.write("        </form>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("    const form = document.querySelector(\"#form__wrap\");\r\n");
      out.write("    const checkAll = document.querySelector(\".terms__check__all input\");\r\n");
      out.write("    const checkBoxes = document.querySelectorAll(\".input__check input\");\r\n");
      out.write("    const submitButton = document.querySelector(\"button\");\r\n");
      out.write("\r\n");
      out.write("    const agreements = {\r\n");
      out.write("      termsOfService: false,\r\n");
      out.write("      privacyPolicy: false,\r\n");
      out.write("      allowPromotions: false\r\n");
      out.write("    };\r\n");
      out.write("\r\n");
      out.write("    checkBoxes.forEach((item) => item.addEventListener(\"input\", toggleCheckbox));\r\n");
      out.write("\r\n");
      out.write("    function toggleCheckbox(e) {\r\n");
      out.write("      const { checked, id } = e.target;\r\n");
      out.write("      agreements[id] = checked;\r\n");
      out.write("      this.parentNode.classList.toggle(\"active\");\r\n");
      out.write("      checkAllStatus();\r\n");
      out.write("      toggleSubmitButton();\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function checkAllStatus() {\r\n");
      out.write("      const { termsOfService, privacyPolicy, allowPromotions } = agreements;\r\n");
      out.write("      if (termsOfService && privacyPolicy && allowPromotions) {\r\n");
      out.write("        checkAll.checked = true;\r\n");
      out.write("      } else {\r\n");
      out.write("        checkAll.checked = false;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function toggleSubmitButton() {\r\n");
      out.write("      const { termsOfService, privacyPolicy } = agreements;\r\n");
      out.write("      if (termsOfService && privacyPolicy) {\r\n");
      out.write("        submitButton.disabled = false;\r\n");
      out.write("      } else {\r\n");
      out.write("        submitButton.disabled = true;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    checkAll.addEventListener(\"click\", (e) => {\r\n");
      out.write("      const { checked } = e.target;\r\n");
      out.write("      if (checked) {\r\n");
      out.write("        checkBoxes.forEach((item) => {\r\n");
      out.write("          item.checked = true;\r\n");
      out.write("          agreements[item.id] = true;\r\n");
      out.write("          item.parentNode.classList.add(\"active\");\r\n");
      out.write("        });\r\n");
      out.write("      } else {\r\n");
      out.write("        checkBoxes.forEach((item) => {\r\n");
      out.write("          item.checked = false;\r\n");
      out.write("          agreements[item.id] = false;\r\n");
      out.write("          item.parentNode.classList.remove(\"active\");\r\n");
      out.write("        });\r\n");
      out.write("      }\r\n");
      out.write("      toggleSubmitButton();\r\n");
      out.write("    });\r\n");
      out.write("    </script>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
