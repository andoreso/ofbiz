<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#if (requestAttributes.externalLoginKey)?exists><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey?if_exists></#if>
<#if (externalLoginKey)?exists><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey?if_exists></#if>
<#assign ofbizServerName = application.getAttribute("_serverId")?default("default-server")>
<#assign contextPath = request.getContextPath()>
<#assign displayApps = Static["org.ofbiz.context.ContextUtil"].getAppBarWebInfos(ofbizServerName, "main")>
<#assign displaySecondaryApps = Static["org.ofbiz.context.ContextUtil"].getAppBarWebInfos(ofbizServerName, "secondary")>

<#assign appModelMenu = Static["org.ofbiz.widget.menu.MenuFactory"].getMenuFromLocation(applicationMenuLocation,applicationMenuName,delegator,dispatcher)>
<#if appModelMenu.getModelMenuItemByName(headerItem)?exists>
  <#if headerItem!="main">
    <#assign show_last_menu = true>
  </#if>
</#if>

<div class="tabbar">
  <div class="breadcrumbs<#if show_last_menu?exists> menu_selected</#if>">
      <div id="main-navigation">
        <h2>${uiLabelMap.CommonApplications}</h2>
        <ul>
          <li>
            <ul><li><ul class="primary">
            <#-- Primary Applications -->
            <#list displayApps as display>
              <#assign thisApp = display.getContextRoot()>
              <#assign selected = false>
                <#if thisApp == contextPath || contextPath + "/" == thisApp>
                  <#assign selected = true>
                </#if>
                <#assign thisURL = thisApp>
                <#if thisApp != "/">
                  <#assign thisURL = thisURL + "/control/main">
                </#if>
                <#-- Show OFBiz Setup component menu bar when the system not have an organization -->
                <#if thisApp.equals("/ofbizsetup")>
                    <#if PartyAcctgPrefAndGroupList.size() == 0>
                        <li><a href="${thisURL + externalKeyParam}" <#if uiLabelMap?exists> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a></li>
                    </#if>
                <#else>
                    <li <#if selected>class="selected"</#if>><a href="${thisURL + externalKeyParam}" <#if uiLabelMap?exists> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a></li>
                </#if>
            </#list>
           </ul></li>
           <li><ul class="secondary">
            <#-- Secondary Applications -->
            <#list displaySecondaryApps as display>
              <#assign thisApp = display.getContextRoot()>
              <#assign selected = false>
                <#if thisApp == contextPath || contextPath + "/" == thisApp>
                  <#assign selected = true>
                </#if>
                <#assign thisURL = thisApp>
                <#if thisApp != "/">
                  <#assign thisURL = thisURL + "/control/main">
                </#if>
                <#-- Show OFBiz Setup component menu bar when the system not have an organization -->
                <#if thisApp.equals("/ofbizsetup")>
                    <#if PartyAcctgPrefAndGroupList.size() == 0>
                        <li><a href="${thisURL + externalKeyParam}" <#if uiLabelMap?exists> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a></li>
                    </#if>
                <#else>
                    <li <#if selected>class="selected"</#if>><a href="${thisURL + externalKeyParam}" <#if uiLabelMap?exists> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a></li>
                </#if>
            </#list>
            </ul>
          </li>
        </ul>
      </div>
