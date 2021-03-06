////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.royale.graphics.utils
{
    COMPILE::JS
    {
        import org.apache.royale.core.UIBase;
        import org.apache.royale.core.WrappedHTMLElement;
    }

    /**
     * @royaleignorecoercion org.apache.royale.core.WrappedHTMLElement
     */
    COMPILE::JS
    public function addSvgElementToElement(element:Element,type:String):WrappedHTMLElement
    {
		var svgNs:String = "http://www.w3.org/2000/svg";
		var elem:WrappedHTMLElement = document.createElementNS(svgNs, type) as WrappedHTMLElement;
		element.appendChild(elem);
		return elem;
    }
}
