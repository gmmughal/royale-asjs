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

package mx.containers
{
/*
import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.TextLineMetrics;
import flash.utils.getQualifiedClassName;
import mx.automation.IAutomationObject;
import mx.containers.utilityClasses.BoxLayout;
import mx.containers.utilityClasses.CanvasLayout;
import mx.containers.utilityClasses.ConstraintColumn;
import mx.containers.utilityClasses.ConstraintRow;
import mx.containers.utilityClasses.IConstraintLayout;
import mx.containers.utilityClasses.Layout;
import mx.controls.Button;
import mx.core.EdgeMetrics;
import mx.core.EventPriority;
import mx.core.IFlexDisplayObject;
import mx.core.IFlexModuleFactory;
import mx.core.IFontContextComponent;
import mx.core.IUIComponent;
import mx.core.IUITextField;
import mx.core.UIComponent;
import mx.core.UIComponentCachePolicy;
import mx.core.UITextField;
import mx.core.UITextFormat;
import mx.core.mx_internal;
import mx.effects.EffectManager;
import mx.events.CloseEvent;
import mx.events.SandboxMouseEvent;
import mx.managers.ISystemManager;
import mx.styles.ISimpleStyleClient;
import mx.styles.IStyleClient;
import mx.styles.StyleProxy;

use namespace mx_internal;
*/
    
import mx.core.Container;
import mx.core.ContainerLayout;
import mx.containers.beads.BoxLayout;
import mx.containers.beads.CanvasLayout;
import org.apache.royale.core.IPanelModel;
import org.apache.royale.core.LayoutBase;

//--------------------------------------
//  Styles
//--------------------------------------
/*
include "../styles/metadata/AlignStyles.as";
include "../styles/metadata/GapStyles.as";
include "../styles/metadata/ModalTransparencyStyles.as";
*/
/**
 *  Alpha of the title bar, control bar and sides of the Panel.
 *
 *  The default value for the Halo theme is <code>0.4</code>.
 *  The default value for the Spark theme is <code>0.5</code>.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="borderAlpha", type="Number", inherit="no", theme="halo, spark")]

/**
 *  Thickness of the bottom border of the Panel control.
 *  If this style is not set and the Panel control contains a ControlBar
 *  control, the bottom border thickness equals the thickness of the top border
 *  of the panel; otherwise the bottom border thickness equals the thickness
 *  of the left border.
 *
 *  @default NaN
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="borderThicknessBottom", type="Number", format="Length", inherit="no", theme="halo")]

/**
 *  Thickness of the left border of the Panel.
 *
 *  @default 10
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="borderThicknessLeft", type="Number", format="Length", inherit="no", theme="halo")]

/**
 *  Thickness of the right border of the Panel.
 *
 *  @default 10
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="borderThicknessRight", type="Number", format="Length", inherit="no", theme="halo")]

/**
 *  Thickness of the top border of the Panel.
 *
 *  @default 2
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="borderThicknessTop", type="Number", format="Length", inherit="no", theme="halo")]

/**
 *  Name of the CSS style declaration that specifies styles to apply to 
 *  any control bar child subcontrol.
 * 
 *  @default null
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="controlBarStyleName", type="String", inherit="no")]

/**
 *  Radius of corners of the window frame.
 *
 *  The default value for the Halo theme is <code>4</code>.
 *  The default value for the Spark theme is <code>0</code>.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="cornerRadius", type="Number", format="Length", inherit="no", theme="halo, spark")]

/**
 *  Boolean property that controls the visibility
 *  of the Panel container's drop shadow.
 *
 *  @default true
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="dropShadowEnabled", type="Boolean", inherit="no", theme="halo")]

/**
 *  Array of two colors used to draw the footer
 *  (area for the ControlBar container) background. 
 *  The first color is the top color. 
 *  The second color is the bottom color.
 *  The default values are <code>null</code>, which
 *  makes the control bar background the same as
 *  the panel background.
 *
 *  @default null
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="footerColors", type="Array", arrayType="uint", format="Color", inherit="yes", theme="halo")]

/**
 *  Array of two colors used to draw the header.
 *  The first color is the top color.
 *  The second color is the bottom color.
 *  The default values are <code>null</code>, which
 *  makes the header background the same as the
 *  panel background.
 *
 *  @default null
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="headerColors", type="Array", arrayType="uint", format="Color", inherit="yes", theme="halo")]

/**
 *  Height of the header.
 *  The default value is based on the style of the title text.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="headerHeight", type="Number", format="Length", inherit="no")]

/**
 *  Alphas used for the highlight fill of the header.
 *
 *  @default [0.3,0]
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="highlightAlphas", type="Array", arrayType="Number", inherit="no", theme="halo")]

/**
 *  Number of pixels between the container's lower border
 *  and its content area.
 *
 *  @default 0
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="paddingBottom", type="Number", format="Length", inherit="no")]

/**
 *  Number of pixels between the container's top border
 *  and its content area.
 *
 *  @default 0
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="paddingTop", type="Number", format="Length", inherit="no")]

/**
 *  Flag to enable rounding for the bottom two corners of the container.
 *  Does not affect the upper two corners, which are normally round. 
 *  To configure the upper corners to be square, 
 *  set <code>cornerRadius</code> to 0.
 *
 *  @default false
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="roundedBottomCorners", type="Boolean", inherit="no", theme="halo")]

/**
 *  Direction of drop shadow.
 *  Possible values are <code>"left"</code>, <code>"center"</code>,
 *  and <code>"right"</code>.
 *
 *  @default "center"
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="shadowDirection", type="String", enumeration="left,center,right", inherit="no", theme="halo")]

/**
 *  Distance of drop shadow.
 *  Negative values move the shadow above the panel.
 *
 *  @default 2
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="shadowDistance", type="Number", format="Length", inherit="no", theme="halo")]

/**
 *  Style declaration name for the status in the title bar.
 *
 *  @default "windowStatus"
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
 
//[Style(name="statusStyleName", type="String", inherit="no")]

/**
 *  The title background skin.
 *
 *  The default value for the Halo theme is <code>mx.skins.halo.TitleBackground</code>.
 *  The default value for the Spark theme is <code>mx.core.UIComponent</code>.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="titleBackgroundSkin", type="Class", inherit="no")]

/**
 *  Style declaration name for the text in the title bar.
 *  The default value is <code>"windowStyles"</code>,
 *  which causes the title to have boldface text.
 *
 *  @default "windowStyles"
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
//[Style(name="titleStyleName", type="String", inherit="no")]

//--------------------------------------
//  Effects
//--------------------------------------

/**
 *  Specifies the effect to play after a Resize effect finishes playing.
 *  To disable the default Dissolve effect, so that the children are hidden
 *  instantaneously, set the value of the
 *  <code>resizeEndEffect</code> property to <code>"none"</code>.  
 *
 *  @default "Dissolve"
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
[Effect(name="resizeEndEffect", event="resizeEnd")]

/**
 *  Specifies the effect to play before a Resize effect begins playing.
 *  To disable the default Dissolve effect, so that the children are hidden
 *  instantaneously, set the value of the
 *  <code>resizeStartEffect</code> property to <code>"none"</code>.  
 *
 *  @default "Dissolve"
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
[Effect(name="resizeStartEffect", event="resizeStart")]

//--------------------------------------
//  Excluded APIs
//--------------------------------------

[Exclude(name="focusIn", kind="event")]
[Exclude(name="focusOut", kind="event")]

[Exclude(name="focusBlendMode", kind="style")]
[Exclude(name="focusSkin", kind="style")]
[Exclude(name="focusThickness", kind="style")]

[Exclude(name="focusInEffect", kind="effect")]
[Exclude(name="focusOutEffect", kind="effect")]

//--------------------------------------
//  Other metadata
//--------------------------------------

[AccessibilityClass(implementation="mx.accessibility.PanelAccImpl")]

//[IconFile("Panel.png")]

[Alternative(replacement="spark.components.Panel", since="4.0")]

/**
 *  A Halo Panel container consists of a title bar, a caption, a border,
 *  and a  content area for its children.
 *  Typically, you use Panel containers to wrap top-level application modules.
 *  For example, you could include a shopping cart in a Panel container.
 * 
 *  <p><b>Note:</b> Adobe recommends that, when possible, you use the 
 *  Spark Panel container instead of the Halo Panel container.</p>
 *
 *  <p>The Panel container has the following default sizing characteristics:</p>
 *     <table class="innertable">
 *        <tr>
 *           <th>Characteristic</th>
 *           <th>Description</th>
 *        </tr>
 *        <tr>
 *           <td>Default size</td>
 *           <td>Height is large enough to hold all of its children at the default height of the children, 
 *               plus any vertical gaps between the children, the top and bottom padding, the top and bottom borders, 
 *               and the title bar.<br/>
 *               Width is the larger of the default width of the widest child plus the left and right padding of the 
 *               container, or the width of the title text, plus the border.</td>
 *        </tr>
 *        <tr>
 *           <td>Padding</td>
 *           <td>4 pixels for the top, bottom, left, and right values.</td>
 *        </tr>
 *     </table>
 *
 *  @mxml
 *  
 *  <p>The <code>&lt;mx:Panel&gt;</code> tag inherits all of the tag 
 *  attributes of its superclass and adds the following tag attributes:</p>
 *  
 *  <pre>
 *  &lt;mx:Panel
 *   <strong>Properties</strong>
 *   layout="vertical|horizontal|absolute"
 *   status=""
 *   title=""
 *   titleIcon="null"
 *  
 *   <strong>Styles</strong>
 *   borderAlpha="0.4"
 *   borderThicknessBottom="NaN"
 *   borderThicknessLeft="10"
 *   borderThicknessRight="10"
 *   borderThicknessTop="2"
 *   controlBarStyleName="null"
 *   cornerRadius="4"
 *   dropShadowEnabled="true|false"
 *   footerColors="null"
 *   headerColors="null"
 *   headerHeight="<i>Based on style of title</i>"
 *   highlightAlphas="[0.3,0]"
 *   horizontalAlign="left|center|right"
 *   horizontalGap="8"
 *   modalTransparency="0.5"
 *   modalTransparencyBlur="3"
 *   modalTransparencyColor="#DDDDDD"
 *   modalTransparencyDuration="100"
 *   paddingBottom="0"
 *   paddingTop="0"
 *   roundedBottomCorners="false|true"
 *   shadowDirection="center|left|right"
 *   shadowDistance="2"
 *   statusStyleName="windowStatus"
 *   titleBackgroundSkin="TitleBackground"
 *   titleStyleName="windowStyles"
 *   verticalAlign="top|middle|bottom"
 *   verticalGap="6"
 *  
 *   <strong>Effects</strong>
 *   resizeEndEffect="Dissolve"
 *   resizeStartEffect="Dissolve"
 *   &gt;
 *      ...
 *      <i>child tags</i>
 *      ...
 *  &lt;/mx:Panel&gt;
 *  </pre>
 *  
 *  @includeExample examples/SimplePanelExample.mxml
 *
 *  @see spark.components.Panel
 *  @see mx.containers.ControlBar
 *  @see mx.containers.VBox
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
public class Panel extends Container
    /*implements IConstraintLayout, IFontContextComponent*/
{
    /*include "../core/Version.as";*/

    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function Panel()
    {
        super();


        layoutObject = new BoxLayout();
        addBead(layoutObject);
    }
    
    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     */
    private var layoutObject:LayoutBase;

    //--------------------------------------------------------------------------
    //
    //  Overridden properties
    //
    //--------------------------------------------------------------------------


    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

        
    //----------------------------------
    //  layout
    //----------------------------------

    /**
     *  @private
     *  Storage for the layout property.
     */
    private var _layout:String = ContainerLayout.VERTICAL;

    [Bindable("layoutChanged")]
    [Inspectable(category="General", enumeration="vertical,horizontal,absolute", defaultValue="vertical")]

    /**
     *  Specifies the layout mechanism used for this container. 
     *  Panel containers can use <code>"vertical"</code>, <code>"horizontal"</code>, 
     *  or <code>"absolute"</code> positioning. 
     *  Vertical positioning lays out the child components vertically from
     *  the top of the container to the bottom in the specified order.
     *  Horizontal positioning lays out the child components horizontally
     *  from the left of the container to the right in the specified order.
     *  Absolute positioning does no automatic layout and requires you to
     *  explicitly define the location of each child component. 
     *
     *  @default "vertical"
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get layout():String
    {
        return _layout;
    }

    /**
     *  @private
     */
    public function set layout(value:String):void
    {
        if (_layout != value)
        {
            _layout = value;

            if (layoutObject)
                // Set target to null for cleanup.
                removeBead(layoutObject);

            if (_layout == ContainerLayout.ABSOLUTE)
                layoutObject = new CanvasLayout();
            else
            {
                layoutObject = new BoxLayout();

                if (_layout == ContainerLayout.VERTICAL)
                    BoxLayout(layoutObject).direction
                        = BoxDirection.VERTICAL;
                else
                    BoxLayout(layoutObject).direction
                        = BoxDirection.HORIZONTAL;
            }

            if (layoutObject)
                addBead(layoutObject);

        }
    }



    //----------------------------------
    //  title
    //----------------------------------

    /**
     *  @private
     *  Storage for the title property.
     */ 
    private var _title:String = "";
    
    /**
     *  @private
     */
    private var _titleChanged:Boolean = false;

    [Bindable("titleChanged")]
    [Inspectable(category="General", defaultValue="")]

    /**
     *  Title or caption displayed in the title bar.
     *
     *  @default ""
     *
     *  @tiptext Gets or sets the title/caption displayed in the title bar
     *  @helpid 3991
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get title():String
    {
        return IPanelModel(model).title;
    }

    /**
     *  @private
     */
    public function set title(value:String):void
    {
        IPanelModel(model).title = value;
    }
    

}

}
