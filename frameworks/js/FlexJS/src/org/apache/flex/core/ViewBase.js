/**
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

goog.provide('org.apache.flex.core.ViewBase');

goog.require('org.apache.flex.core.IPopUpHost');
goog.require('org.apache.flex.core.UIBase');
goog.require('org.apache.flex.core.ValuesManager');
goog.require('org.apache.flex.events.Event');
goog.require('org.apache.flex.events.ValueChangeEvent');
goog.require('org.apache.flex.utils.MXMLDataInterpreter');



/**
 * @constructor
 * @implements {org.apache.flex.core.IPopUpHost}
 * @extends {org.apache.flex.core.UIBase}
 */
org.apache.flex.core.ViewBase = function() {
  org.apache.flex.core.ViewBase.base(this, 'constructor');

  /**
   * @private
   * @type {Array}
   */
  this.states_ = null;

  /**
   * @private
   * @type {Array}
   */
  this.transitions_ = null;

  /**
   * @private
   * @type {string}
   */
  this.currentState_ = '';

  /**
   * @private
   * @type {boolean}
   */
  this.initialized_ = false;

  this.document = this;

};
goog.inherits(org.apache.flex.core.ViewBase, org.apache.flex.core.UIBase);


/**
 * Metadata
 *
 * @type {Object.<string, Array.<Object>>}
 */
org.apache.flex.core.ViewBase.prototype.FLEXJS_CLASS_INFO =
    { names: [{ name: 'ViewBase',
                qName: 'org.apache.flex.core.ViewBase' }],
      interfaces: [org.apache.flex.core.IPopUpHost] };


/**
 * @expose
 * @type {Object}
 */
org.apache.flex.core.ViewBase.prototype.applicationModel = null;


/**
 * @expose
 * @param {Array} data The data for the attributes.
 */
org.apache.flex.core.ViewBase.prototype.generateMXMLAttributes = function(data) {
  org.apache.flex.utils.MXMLDataInterpreter.generateMXMLProperties(this, data);
};


/**
 * @expose
 * @type {Array}
 */
org.apache.flex.core.ViewBase.prototype.MXMLDescriptor = null;


/**
 * @expose
 * @type {Object} The document.
 */
org.apache.flex.core.ViewBase.prototype.document = null;


/**
 * @expose
 * @return {Array} An array of descriptors.
 */
org.apache.flex.core.ViewBase.prototype.get_MXMLDescriptor = function() {
  return this.MXMLDescriptor;
};


/**
 * @expose
 * @param {Object} doc The document.
 * @param {Array} desc The descriptor data;
 */
org.apache.flex.core.ViewBase.prototype.setMXMLDescriptor =
    function(doc, desc) {
  this.MXMLDescriptor = desc;
  this.document = doc;
};


/**
 * @expose
 */
org.apache.flex.core.ViewBase.prototype.addedToParent = function() {

  //org.apache.flex.core.ViewBase.base(this,'addedToParent');
  this.element.flexjs_wrapper = this;
  if (org.apache.flex.core.ValuesManager.valuesImpl.init) {
    org.apache.flex.core.ValuesManager.valuesImpl.init(this);
  }

  org.apache.flex.core.ViewBase.base(this, 'addedToParent');

  if (!this.initialized_) {
    org.apache.flex.utils.MXMLDataInterpreter.generateMXMLInstances(this.document,
      this, this.get_MXMLDescriptor());

    this.dispatchEvent(new org.apache.flex.events.Event('initBindings'));
    this.dispatchEvent(new org.apache.flex.events.Event('initComplete'));
    this.initialized_ = true;
  }
  this.dispatchEvent(new org.apache.flex.events.Event('childrenAdded'));
};


/**
 * @expose
 * @return {Object} The application model.
 */
org.apache.flex.core.ViewBase.prototype.get_applicationModel = function() {
  return this.applicationModel;
};


/**
 * @expose
 * @return {Array} The array of State objects.
 */
org.apache.flex.core.ViewBase.prototype.get_states = function() {
  return this.states_;
};


/**
 * @expose
 * @param {Array} value The array of State objects.
 */
org.apache.flex.core.ViewBase.prototype.set_states = function(value) {
  this.states_ = value;

  if (org.apache.flex.core.ValuesManager.valuesImpl.getValue) {
    /**
     * @type {Function}
     */
    var impl = /** @type {Function} */ (org.apache.flex.core.ValuesManager.valuesImpl.
        getValue(this, 'iStatesImpl'));
    // TODO: (aharui) check if bead already exists
    this.addBead(new impl());
  }
};


/**
 * @expose
 * @param {string} state The name of the state.
 * @return {boolean} True if state in states array.
 */
org.apache.flex.core.ViewBase.prototype.hasState = function(state) {
  for (var p in this.states_)
  {
    var s = this.states_[p];
    if (s.name == state)
      return true;
  }
  return false;
};


/**
 * @expose
 * @return {string} The name of the current state.
 */
org.apache.flex.core.ViewBase.prototype.get_currentState = function() {
  return this.currentState_;
};


/**
 * @expose
 * @param {string} value The name of the current state.
 */
org.apache.flex.core.ViewBase.prototype.set_currentState = function(value) {
  var event = new org.apache.flex.events.ValueChangeEvent(
      'currentStateChanged', this.currentState_, value);
  this.currentState_ = value;
  this.dispatchEvent(event);
};


/**
 * @expose
 * @return {Array} The array of transitions.
 */
org.apache.flex.core.ViewBase.prototype.get_transitions = function() {
  return this.transitions_;
};


/**
 * @expose
 * @param {Array} value The array of transitions.
 */
org.apache.flex.core.ViewBase.prototype.set_transitions = function(value) {
  this.transitions_ = value;
};

