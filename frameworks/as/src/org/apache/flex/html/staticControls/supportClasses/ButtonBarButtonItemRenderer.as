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
package org.apache.flex.html.staticControls.supportClasses
{
	import org.apache.flex.events.Event;
	import org.apache.flex.html.staticControls.TextButton;
	import org.apache.flex.html.staticControls.beads.ITextItemRenderer;

	public class ButtonBarButtonItemRenderer extends UIItemRendererBase implements ITextItemRenderer
	{
		public function ButtonBarButtonItemRenderer()
		{
			super();
		}
		
		private var textButton:TextButton;
		
		override public function addedToParent():void
		{
			super.addedToParent();
		}
		
		private function handleClickEvent(event:Event):void
		{
			this.dispatchEvent(new Event("selected"));
		}
		
		public function get text():String
		{
			return data as String;
		}
		public function set text(value:String):void
		{
			data = value;
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			
			var added:Boolean = false;
			if (textButton == null) {
				textButton = new TextButton();
				textButton.addEventListener('click',handleClickEvent);
				added = true;
			}
			
			var valueAsString:String;
			
			if (value is String) {
				valueAsString = value as String;
			}
			else if (value.hasOwnProperty("label")) {
				valueAsString = String(value["label"]);
			}
			else if (value.hasOwnProperty("title")) {
				valueAsString = String(value["title"]);
			}
			
			if (valueAsString) textButton.text = valueAsString;
			
			if (added) addElement(textButton);
		}
		
		override public function adjustSize():void
		{
			textButton.width = this.width;
			textButton.height = this.height;
			
			updateRenderer();
		}
	}
}