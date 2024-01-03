var customModule = {};

window.modules = {}, $(function() {
"object" == typeof window.modules && $.each(window.modules, function(e, t) {
void 0 !== customModule[e] && customModule[e].run(t);
});
});

var templates = {};

templates["addfunds/alert"] = _.template('<div class="alert alert-dismissible alert-danger ">\n    <button type="button" class="close" data-dismiss="alert">×</button>\n    <%= text %>\n</div>'), 
templates["addfunds/checkbox"] = _.template('<div class="form-group fields" id="order_<%= name %>">\n    <div class="form-group__checkbox">\n        <label class="form-group__checkbox-label">\n            <input name="AddFoundsForm[fields][<%= name %>]" value="0" type="hidden"/>\n            <input name="AddFoundsForm[fields][<%= name %>]" value="1" type="checkbox" id="field-<%= name %>"/>\n            <span class="checkmark"></span>\n        </label>\n        <label for="field-<%= name %>" class="form-group__label-title">\n            <%= label %>\n        </label>\n    </div>\n</div>'), 
templates["addfunds/cryptochill_payment_request_btn"] = _.template('<button type=\'button\' id="<%= id %>" data-amount="<%= amount %>" data-product="<%= product %>" data-passthrough="<%= passthrough %>" data-currency="<%= currency %>" class="hidden btn cryptochill-button"><%= product %></button>'), 
templates["addfunds/custom/credit_card"] = _.template('<div class="form-group fields">\n    <label class="control-label"><%= card_number.label %></label>\n    <input class="form-control" id="field-visible-<%= card_number.name %>" name="AddFoundsForm[fields][<%= card_number.name %>]" value="<%= card_number.value %>" type="text" autocomplete="off" placeholder="XXXX-XXXX-XXXX-XXXX" size="19" >\n</div>\n<div class="row">\n    <div class="col-md-4 form-group fields">\n        <label class="control-label"><%= expiry_month.label %></label>\n        <input class="form-control" id="field-visible-<%= expiry_month.name %>" name="AddFoundsForm[fields][<%= expiry_month.name %>]" value="<%= expiry_month.value %>" placeholder="MM" minlength="2" maxlength="2" type="number">\n    </div>\n    <div class="col-md-4 form-group fields">\n        <label class="control-label"><%= expiry_year.label %></label>\n        <input class="form-control" id="field-visible-<%= expiry_year.name %>" name="AddFoundsForm[fields][<%= expiry_year.name %>]" value="<%= expiry_year.value %>" placeholder="YY" minlength="2" maxlength="2" type="number">\n    </div>\n    <div class="col-md-4 form-group fields">\n        <label class="control-label"><%= cvv.label %></label>\n        <input autocomplete="on" class="form-control" id="field-visible-<%= cvv.name %>" name="AddFoundsForm[fields][<%= cvv.name %>]" value="<%= cvv.value %>" maxlength="4" type="password">\n    </div>\n</div>'), 
templates["addfunds/description"] = _.template('<div class="form-group fields" id="order_<%= name %>">\n    <label class="control-label" for="field-<%= name %>"><%= label %></label>\n    <div class="panel-body border-solid border-rounded text-center"><%= value %></div>\n</div>'), 
templates["addfunds/hidden"] = _.template('<input class="fields" name="AddFoundsForm[fields][<%= name %>]" value="<%= value %>" type="hidden" id="field-<%= name %>"/>'), 
templates["addfunds/input"] = _.template('<div class="form-group fields" id="order_<%= name %>">\n    <label class="control-label" for="field-<%= name %>"><%= label %></label>\n    <input class="form-control" name="AddFoundsForm[fields][<%= name %>]" value="<%= value %>" type="text" id="field-<%= name %>"/>\n</div>'), 
templates["addfunds/modal/adyen_modal"] = _.template('<div class="modal fade" id="adyenModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n            <div class="modal-body">\n                <div id="dropin-container"></div>\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/checkout_com_card"] = _.template('<div class="modal fade" id="checkoutcomCardModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n            <form method="POST">\n                <div class="modal-body">\n                    <div class="frames-container">\n                        \x3c!-- form will be added here --\x3e\n                    </div>\n                    \x3c!-- add submit button --\x3e\n                </div>\n                <div class="modal-footer">\n                    <button type="submit" class="button-credit-card btn btn-primary">\n                        <%= submit_title %>\n                    </button>\n                    <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal">\n                        <%= cancel_title %>\n                    </button>\n                </div>\n            </form>\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/gb_prime_pay_3ds"] = _.template('<style>\n    @keyframes spinner{\n        to{transform:rotate(360deg)}\n    }\n    .spinner-block__inline{display:inline-block}\n    .spinner-block__container{display:block;width:100%;height:558px}\n    .spinner-block__wrapper{position:relative;display:flex;align-items:center;justify-content:center}\n    .spinner-block__small{width:16px;height:16px}\n    .spinner-block__small span{font-size:14px}\n    .spinner-block__medium{width:24px;height:24px}\n    .spinner-block__medium span{font-size:24px}\n    .spinner-block__high{width:42px;height:42px}\n    .spinner-block__high span{font-size:42px}\n    .spinner-block__wrapper span{animation:spinner .6s linear infinite}\n</style>\n<div class="modal fade" id="gbPrimePay3dsCardModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n            <div class="modal-body">\n                    <div id="gb-form" style="height: 558px;">\n                        <div class="spinner-block__wrapper spinner-block__container" id="gb-modal-spinner">\n                            <div class="spinner-block__wrapper spinner-block__high">\n                                <span class="fal fa-spinner-third"></span>\n                            </div>\n                        </div>\n                    </div>\n            </div>\n            <div class="modal-footer">\n                <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal"><%= close_title %></button>\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/qr_code_modal"] = _.template('<style>\n    @keyframes spinner{\n        to{transform:rotate(360deg)}\n    }\n    .spinner-block__inline{display:inline-block}\n    .spinner-block__container{display:block;width:100%;height:558px}\n    .spinner-block__wrapper{position:relative;display:flex;align-items:center;justify-content:center}\n    .spinner-block__small{width:16px;height:16px}\n    .spinner-block__small span{font-size:14px}\n    .spinner-block__medium{width:24px;height:24px}\n    .spinner-block__medium span{font-size:24px}\n    .spinner-block__high{width:42px;height:42px}\n    .spinner-block__high span{font-size:42px}\n    .spinner-block__wrapper span{animation:spinner .6s linear infinite}\n</style>\n<div class="modal fade" tabindex="-1" role="dialog" id="qr-modal" data-backdrop="static">\n    <div class="modal-dialog" role="document">\n        <form class="modal-content">\n            <div class="modal-body">\n                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n                <div class="text-center">\n                    <div class="spinner-block__wrapper spinner-block__container" id="qr-modal-spinner">\n                        <div class="spinner-block__wrapper spinner-block__high">\n                            <span class="fal fa-spinner-third"></span>\n                        </div>\n                    </div>\n                    <img alt="" class="img-responsive center-block" id="qr-code-image">\n                </div>\n            </div>\n            <div class="modal-footer">\n                <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal"><%= close_title %></button>\n            </div>\n        </form>\n    </div>\n</div>'), 
templates["addfunds/modal/qr_code_modal_canvas"] = _.template('<style>\n    @keyframes spinner{\n        to{transform:rotate(360deg)}\n    }\n    .spinner-block__inline{display:inline-block}\n    .spinner-block__container{display:block;width:100%;height:558px}\n    .spinner-block__wrapper{position:relative;display:flex;align-items:center;justify-content:center}\n    .spinner-block__small{width:16px;height:16px}\n    .spinner-block__small span{font-size:14px}\n    .spinner-block__medium{width:24px;height:24px}\n    .spinner-block__medium span{font-size:24px}\n    .spinner-block__high{width:42px;height:42px}\n    .spinner-block__high span{font-size:42px}\n    .spinner-block__wrapper span{animation:spinner .6s linear infinite}\n    #qr-code-container img{margin: auto}\n</style>\n<div class="modal fade" tabindex="-1" role="dialog" id="qr-modal" data-backdrop="static">\n    <div class="modal-dialog" role="document">\n        <form class="modal-content">\n            <div class="modal-body">\n                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n                <div class="text-center">\n                    <div class="spinner-block__wrapper spinner-block__container" id="qr-modal-spinner">\n                        <div class="spinner-block__wrapper spinner-block__high">\n                            <span class="fal fa-spinner-third"></span>\n                        </div>\n                    </div>\n\n                    <div class="center-block" id="qr-code-container"></div>\n                </div>\n            </div>\n            <div class="modal-footer">\n                <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal"><%= close_title %></button>\n            </div>\n        </form>\n    </div>\n</div>'), 
templates["addfunds/modal/shopinext_card"] = _.template('<div class="modal fade" id="shopinextCardModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n\n            <div class="modal-body">\n                <form action="" method="POST" id="shopinextCardForm">\n                    <div id="card-error-container" class="error-summary alert alert-danger hidden"></div>\n\n                    <div class="form-group">\n                        <label class="control-label" for="card-name"><%= card_name %></label>\n                        <input id="card-name" class="form-control" name="name" autocomplete="off" maxlength="32" />\n                    </div>\n                    <div class="form-group">\n                        <label class="control-label" for="card-number"><%= card_number %></label>\n                        <input id="card-number" class="form-control" name="number" autocomplete="off" maxlength="19" />\n                    </div>\n                    <div class="form-group">\n                        <label class="control-label" for="expiration-month"><%= expiry_month %></label>\n                        <input id="expiration-month" class="form-control" name="month" autocomplete="off" maxlength="2">\n                    </div>\n                    <div class="form-group">\n                        <label class="control-label" for="expiration-year"><%= expiry_year %></label>\n                        <input id="expiration-year" class="form-control" name="year" autocomplete="off" maxlength="4">\n                    </div>\n                    <div class="form-group">\n                        <label class="control-label" for="cvv"><%= cvv %></label>\n                        <input id="cvv" class="form-control" name="cvv" autocomplete="off" maxlength="4">\n                    </div>\n\n                    <div id="error"></div>\n\n                    <div class="modal-footer">\n                        <button type="submit" class="button-credit-card btn btn-primary btn-big-primary">\n                            <%= submit_title %>\n                        </button>\n                        <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal">\n                            <%= cancel_title %>\n                        </button>\n                    </div>\n\n                </form>\n            </div>\n\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/squareup_card"] = _.template('<div class="modal fade" id="squareupCardModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n\n            <div id="form-container">\n                <div id="sq-ccbox">\n                    \x3c!--\n                      Be sure to replace the action attribute of the form with the path of\n                      the Transaction API charge endpoint URL you want to POST the nonce to\n                      (for example, "/process-card")\n                    --\x3e\n                    <form id="nonce-form" novalidate>\n                        <div class="modal-body">\n\n                            <div id="card-error-container" class="error-summary alert alert-danger hidden"></div>\n\n                            <fieldset>\n                                <div class="form-group">\n                                    <label class="control-label" for="sq-card-number"><%= card_number %></label>\n                                    <div id="sq-card-number" class="form-control"></div>\n                                </div>\n                                <div class="form-group">\n                                    <label class="control-label" for="sq-expiration-date"><%= expiration_date %></label>\n                                    <div id="sq-expiration-date" class="form-control"></div>\n                                </div>\n                                <div class="form-group">\n                                    <label class="control-label" for="sq-cvv"><%= cvv %></label>\n                                    <div id="sq-cvv" class="form-control"></div>\n                                </div>\n                                <div class="form-group">\n                                    <label class="control-label" for="sq-postal-code"><%= postal_code %></label>\n                                    <div id="sq-postal-code" class="form-control"></div>\n                                </div>\n                            </fieldset>\n\n                            <div id="error"></div>\n                            \x3c!--\n                              After a nonce is generated it will be assigned to this hidden input field.\n                            --\x3e\n                            <input type="hidden" id="card-nonce" name="nonce">\n                        </div>\n\n                        <div class="modal-footer">\n                            <button id="sq-creditcard" type="submit" class="button-credit-card btn btn-primary btn-big-primary">\n                                <%= submit_title %>\n                            </button>\n                            <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal">\n                                <%= cancel_title %>\n                            </button>\n                        </div>\n\n                    </form>\n                </div> \x3c!-- end #sq-ccbox --\x3e\n            </div> \x3c!-- end #form-container --\x3e\n\n        </div>\n    </div>\n</div>'), 
templates["addfunds/select"] = _.template('<div class="form-group fields" id="order_<%= name %>">\n    <label class="control-label" for="field-<%= name %>"><%= label %></label>\n    <select class="form-control" name="AddFoundsForm[fields][<%= name %>]" id="field-<%= name %>">\n        <% _.forEach(options, function(optLabel, optValue) {%>\n        <option value="<%= optValue %>" <% if (value == optValue) { %> selected <% } %>><%= optLabel %></option>\n        <%}); %>\n    </select>\n</div>'), 
templates["addfunds/stripe_card_element"] = _.template('<div class="form-group">\n    <label class="control-label" ><%= label %></label>\n    <div id="stripe-card-element" ></div>\n</div>'), 
templates["addfunds/stripe_iban_element"] = _.template('<div class="form-group" style="position: relative;">\n    <label class="control-label"><%= label %></label>\n    <div id="stripe-iban-element" class="form-control"></div>\n    <div id="stripe-iban-bank-name" style="position: absolute; right: 10px; margin-top: -30px; opacity: 0.8; z-index: 1;"></div>\n</div>'), 
templates["addfunds/stripe_payment_request_btn"] = _.template('<span id="<%= id %>" style="width: 150px; height: 18px; display: inline-block;" class="hidden"></span>'), 
templates["admin/integration_files"] = _.template('<% _.each(files, function(file) { %>\n<div class="row">\n    <div class="col-md-10">\n        <div class="form-group">\n            <label class="control-label" for="<%= file.file_name %>"><%= file.file_name %></label>\n            <% if(file.uploaded == true) { %>\n            <a href="/<%= file.file_name %>" target="_blank"><span class="fal fa-external-link"></span></a>\n            <% }; %>\n            <input type="hidden" name="EditIntegrationForm[files][]" value="<%= file.file_name %>">\n            <input type="file" id="<%= file.file_name %>" name="EditIntegrationForm[files][]" accept="<%= file.accept %>">\n        </div>\n    </div>\n</div>\n<% }); %>'), 
templates["admin/integration_settings_input"] = _.template('<div class="form-group">\n    <label for="edit-integration-settings-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <input class="form-control" value="<%= data[\'value\'] %>" name="EditIntegrationForm[settings][<%= data[\'name\'] %>]" id="edit-integration-settings-<%= data[\'code\'] %>">\n    <% if(data[\'help\']) { %>\n        <small class="help-block"><%= data[\'help\'] %></small>\n    <% }; %>\n</div>'), 
templates["admin/integration_settings_select"] = _.template('<div class="form-group">\n    <label for="edit-integration-settings-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <select class="form-control" name="EditIntegrationForm[settings][<%= data[\'name\'] %>]" id="edit-integration-settings-<%= data[\'code\'] %>">\n        <% _.forEach(data[\'options\'], function(label, value) {%>\n            <option value="<%= value %>" <% if (value == data[\'value\']) { %> selected <% } %>><%= label %></option>\n        <%}); %>\n    </select>\n</div>'), 
templates["admin/payment_settings_amounts_container"] = _.template("<div id=\"amount_container_row\" class=\"hidden\">\n    <div id=\"amount_container\">\n        <%= content %>\n    </div>\n    <a href=\"#\" class=\"form-group__generator-link add-amount\" data-id=\"#amount_container\" data-code='<%= JSON.stringify(data['code']) %>' data-name='<%= JSON.stringify(data['name']) %>' data-label='<%= JSON.stringify(data['label']) %>'><span><%= data['add_label'] %></span></a>\n</div>"), 
templates["admin/modules_modal_input"] = _.template('<div class="form-group">\n    <label class="control-label"><%= label %></label>\n    <input type="number" name="form_fields[<%= name %>]" class="form-control" value="<%= value %>">\n</div>'), 
templates["admin/payment_settings_checkbox"] = _.template('<div class="form-check">\n    <div class="form-group__checkbox">\n        <label class="form-group__checkbox-label">\n            <input type="checkbox" class="form-check-input" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]" id="edit-payment-method-options-<%= data[\'code\'] %>" value="1" <% if (parseInt(data[\'value\'])) { %> checked<% } %>>\n            <input type="hidden" class="form-check-input" value=0 name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]"  <% if (!parseInt(data[\'value\'])) { %> disabled<% } %>>\n            <span class="checkmark"></span>\n        </label>\n        <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="form-group__label-title form-check-label">\n            <%= data[\'label\'] %>\n        </label>\n    </div>\n</div>'), 
templates["admin/payment_settings_commission_block"] = _.template('<label for="" class="control-label">Сommission</label>\n<div class="form-group__levels-row">\n    <div class="form-group__levels">\n        <label class="form-group__levels-label" for="editpaymentmethodform-pricefixed">Fixed (1.00)</label>\n        <input type="number" step="0.01" placeholder="0.00" value="<%= data.price_fixed %>" id="editpaymentmethodform-pricefixed"\n               name="EditPaymentMethodForm[priceFixed]">\n    </div>\n    <div class="form-group__levels-text">+</div>\n    <div class="form-group__levels">\n        <label class="form-group__levels-label" for="editpaymentmethodform-pricepercent">Percent (%)</label>\n        <input type="number" placeholder="0" value="<%= data.price_percent %>" id="editpaymentmethodform-pricepercent"\n               name="EditPaymentMethodForm[pricePercent]">\n    </div>\n</div>'), 
templates["admin/payment_settings_course"] = _.template('<div class="form-group">\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <input type="text" class="form-control" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]" id="edit-payment-method-options-<%= data[\'code\'] %>" value="<%= data[\'value\'] %>">\n</div>'), 
templates["admin/payment_settings_input"] = _.template('<div class="form-group">\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <input type="text" class="form-control" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]" id="edit-payment-method-options-<%= data[\'code\'] %>" value="<%= data[\'value\'] %>" <% if(data.disabled) { %> disabled <% } %>>\n</div>'), 
templates["admin/payment_settings_meta_tag_editable"] = _.template('<div class="form-group">\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <div class="input-group">\n\n        <input type="text"\n               class="form-control"\n               style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;"\n               name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]"\n               id="edit-payment-method-options-<%= data[\'code\'] %>"\n               value="<%= data[\'value\'] %>"\n               placeholder="<%= data[\'placeholder\'] %>"\n        <% if(data.value) { %> disabled <% } %>>\n\n        <div class="input-group-btn">\n            <div style="padding-left: 15px;">\n                <button type="button" class="btn btn-default" id="edit-payment-method-options-<%= data[\'code\'] %>-button"><%= Boolean(data[\'value\']) ? data[\'button_edit_title\'] : data[\'button_add_title\'] %></button>\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["admin/payment_settings_multi_input"] = _.template('<div class="form-group form-group__paypal-description">\n    <span class="fas fa-times remove__paypal-description"></span>\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <input required type="text" class="form-control" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>][]" id="edit-payment-method-options-<%= data[\'code\'] %>" value="<%= value %>">\n</div>'), 
templates["admin/payment_settings_multi_input_container"] = _.template('<div id="multi_input_container_<%= data[\'code\'] %>">\n    <%= content %>\n</div>\n<a href="#" class="add-multi-input" data-id="#multi_input_container_<%= data[\'code\'] %>" data-code="<%= data[\'code\'] %>" data-name="<%= data[\'name\'] %>" data-label="<%= data[\'label\'] %>"><span><%= data[\'add_label\'] %></span></a>'), 
templates["admin/payment_settings_select"] = _.template('<div class="form-group">\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <select class="form-control" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]" id="edit-payment-method-options-<%= data[\'code\'] %>">\n        <% _.forEach(data[\'options\'], function(label, value) {%>\n        <option value="<%= value %>" <% if (value == data[\'value\']) { %> selected <% } %>><%= label %></option>\n        <%}); %>\n    </select>\n</div>'), 
templates["admin/payment_settings_textarea"] = _.template('<div class="form-group">\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <textarea cols="30" rows="10" class="form-control <%= data[\'options\'][\'class\'] %>" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]" id="edit-payment-method-options-<%= data[\'code\'] %>" <% if(data.disabled) { %> disabled <% } %>><%= data[\'value\'] %></textarea>\n</div>'), 
templates["admin/integration_snippet"] = _.template('<div class="form-group field-editintegrationform-code-<%= name %>">\n    <label class="control-label" for="editintegrationform-code-<%= name %>"><%= label %></label>\n    <textarea id="editintegrationform-code-<%= name %>" class="form-control" name="EditIntegrationForm[code][<%= name %>]" rows="7" placeholder=""><%= value %></textarea>\n</div>'), 
templates["admin/subscriptions_fail_details"] = _.template('<div class="form-group">\n    <label id="details_provider" for="details_details" class="control-label"><%= details.content_label %></label>\n    <textarea id="details_details" class="form-control" rows="7" readonly><%= details.content %></textarea>\n</div>\n<div class="form-group">\n    <label for="details_code"><%= details.code_label %></label>\n    <input id="details_code" type="text" class="form-control" value="<%= details.code %>" readonly="">\n</div>'), 
templates["admin/payment_settings_amounts"] = _.template('<div class="form-group__generator-row">\n    <span class="fas fa-times remove__generator-row"></span>\n    <div class="row">\n        <div class="col-md-4">\n            <div class="form-group">\n                <label for="edit-payment-method-options-amounts-<%= data[\'code\'][\'amount\'] %>" class="control-label"><%= data[\'label\'][\'amount\'] %></label>\n                <input type="number" class="form-control" name="EditPaymentMethodForm[options][amounts][<%= data[\'name\'][\'amount\'] %>][<% if (index) { %><%= index %><% } %>]" id="edit-payment-method-options-amounts-<%= data[\'code\'][\'amount\'] %>" value="<%= value[\'amount\'] %>">\n\n            </div>\n        </div>\n        <div class="col-md-8">\n            <div class="form-group">\n                <label for="edit-payment-method-options-amounts-<%= data[\'code\'][\'description\'] %>" class="control-label"><%= data[\'label\'][\'description\'] %></label>\n                <input type="text" class="form-control amount-description" name="EditPaymentMethodForm[options][amounts][<%= data[\'name\'][\'description\'] %>][<% if (index) { %><%= index %><% } %>]" id="edit-payment-method-options-amounts-<%= data[\'code\'][\'description\'] %>" value="<%= value[\'description\'] %>">\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["admin/users_activity_log_rows"] = _.template("<% _.each(rows, function(row) { %>\n<tr>\n    <td><%= row.ip %></td>\n    <td><%= row.date %></td>\n</tr>\n<% }); %>"), 
templates["admin/payment_settings_select"] = _.template('<div class="form-group">\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <select class="form-control" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]" id="edit-payment-method-options-<%= data[\'code\'] %>">\n        <% _.forEach(data[\'options\'], function(label, value) {%>\n        <option value="<%= value %>" <% if (value == data[\'value\']) { %> selected <% } %>><%= label %></option>\n        <%}); %>\n    </select>\n</div>'), 
templates["admin/integration_settings_input"] = _.template('<div class="form-group">\n    <label for="edit-integration-settings-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <input class="form-control" value="<%= data[\'value\'] %>" name="EditIntegrationForm[settings][<%= data[\'name\'] %>]" id="edit-integration-settings-<%= data[\'code\'] %>">\n    <% if(data[\'help\']) { %>\n        <small class="help-block"><%= data[\'help\'] %></small>\n    <% }; %>\n</div>'), 
templates["admin/payment_settings_multi_input"] = _.template('<div class="form-group form-group__paypal-description">\n    <span class="fas fa-times remove__paypal-description"></span>\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <input required type="text" class="form-control" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>][]" id="edit-payment-method-options-<%= data[\'code\'] %>" value="<%= value %>">\n</div>'), 
templates["admin/integration_files"] = _.template('<% _.each(files, function(file) { %>\n<div class="row">\n    <div class="col-md-10">\n        <div class="form-group">\n            <label class="control-label" for="<%= file.file_name %>"><%= file.file_name %></label>\n            <% if(file.uploaded == true) { %>\n            <a href="/<%= file.file_name %>" target="_blank"><span class="fal fa-external-link"></span></a>\n            <% }; %>\n            <input type="hidden" name="EditIntegrationForm[files][]" value="<%= file.file_name %>">\n            <input type="file" id="<%= file.file_name %>" name="EditIntegrationForm[files][]" accept="<%= file.accept %>">\n        </div>\n    </div>\n</div>\n<% }); %>'), 
templates["admin/payment_settings_meta_tag_editable"] = _.template('<div class="form-group">\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <div class="input-group">\n\n        <input type="text"\n               class="form-control"\n               style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;"\n               name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]"\n               id="edit-payment-method-options-<%= data[\'code\'] %>"\n               value="<%= data[\'value\'] %>"\n               placeholder="<%= data[\'placeholder\'] %>"\n        <% if(data.value) { %> disabled <% } %>>\n\n        <div class="input-group-btn">\n            <div style="padding-left: 15px;">\n                <button type="button" class="btn btn-default" id="edit-payment-method-options-<%= data[\'code\'] %>-button"><%= Boolean(data[\'value\']) ? data[\'button_edit_title\'] : data[\'button_add_title\'] %></button>\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["admin/subscriptions_details"] = _.template('<% if (details.reason.content) { %>\n<div class="form-group">\n    <label for="reason"><%= details.reason.label %></label>\n    <input type="text" readonly class="form-control" id="reason" value="<%= details.reason.content %>">\n</div>\n<% } %>\n\n<% if (details.message.content) { %>\n<div class="form-group">\n    <label for=""><%= details.message.label %></label>\n    <input type="text" readonly class="form-control" id="" value="<%= details.message.content %>">\n</div>\n<% } %>'), 
templates["admin/modules_modal_select"] = _.template('<div class="form-group">\n    <label for="" class="control-label"><%= label %></label>\n    <select name="form_fields[<%= name %>]" class="form-control">\n        <% _.each(selectItems, function(item) { %>\n        <option <% if (item.value == value) { %> selected="selected" <% } %> value="<%= item.value %>"><%= item.label %></option>\n        <% }); %>\n    </select>\n</div>'), 
templates["admin/payment_settings_course"] = _.template('<div class="form-group">\n    <label for="edit-payment-method-options-<%= data[\'code\'] %>" class="control-label"><%= data[\'label\'] %></label>\n    <input type="text" class="form-control" name="EditPaymentMethodForm[options][<%= data[\'name\'] %>]" id="edit-payment-method-options-<%= data[\'code\'] %>" value="<%= data[\'value\'] %>">\n</div>'), 
templates["admin/payment_settings_commission_block"] = _.template('<label for="" class="control-label">Сommission</label>\n<div class="form-group__levels-row">\n    <div class="form-group__levels">\n        <label class="form-group__levels-label" for="editpaymentmethodform-pricefixed">Fixed (1.00)</label>\n        <input type="number" step="0.01" placeholder="0.00" value="<%= data.price_fixed %>" id="editpaymentmethodform-pricefixed"\n               name="EditPaymentMethodForm[priceFixed]">\n    </div>\n    <div class="form-group__levels-text">+</div>\n    <div class="form-group__levels">\n        <label class="form-group__levels-label" for="editpaymentmethodform-pricepercent">Percent (%)</label>\n        <input type="number" placeholder="0" value="<%= data.price_percent %>" id="editpaymentmethodform-pricepercent"\n               name="EditPaymentMethodForm[pricePercent]">\n    </div>\n</div>'), 
templates["admin/payment_settings_multi_input_container"] = _.template('<div id="multi_input_container_<%= data[\'code\'] %>">\n    <%= content %>\n</div>\n<a href="#" class="add-multi-input" data-id="#multi_input_container_<%= data[\'code\'] %>" data-code="<%= data[\'code\'] %>" data-name="<%= data[\'name\'] %>" data-label="<%= data[\'label\'] %>"><span><%= data[\'add_label\'] %></span></a>'), 
templates["user/user_info_modal"] = _.template('\x3c!-- Modal --\x3e\n<div class="modal fade" id="userInfoModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">\n    <div class="modal-dialog" role="document">\n        <form action="<%= action %>" id="userInfoForm" method="POST" class="modal-content">\n            <div class="modal-body">\n                <div id="userInfoError" class="error-summary alert alert-danger hidden"></div>\n                <div class="form-group">\n                    <label for="first_name"><%= labels[\'first_name\'] %></label>\n                    <input type="text" class="form-control" id="first_name" name="UpdateUserInfoFrom[first_name]" value="<%= values[\'first_name\'] %>">\n                </div>\n                <div class="form-group">\n                    <label for="last_name"><%= labels[\'last_name\'] %></label>\n                    <input type="text" class="form-control" id="last_name" name="UpdateUserInfoFrom[last_name]" value="<%= values[\'last_name\'] %>">\n                </div>\n\n                <input type="hidden" name="_csrf" value="<%= csrftoken %>">\n\n                <button type="submit" class="btn btn-primary btn-big-primary" id="userInfoSubmit"><%= labels[\'submit_btn\'] %></button>\n            </div>\n        </form>\n    </div>\n</div>'), 
templates["addfunds/select"] = _.template('<div class="form-group fields" id="order_<%= name %>">\n    <label class="control-label" for="field-<%= name %>"><%= label %></label>\n    <select class="form-control" name="AddFoundsForm[fields][<%= name %>]" id="field-<%= name %>">\n        <% _.forEach(options, function(optLabel, optValue) {%>\n        <option value="<%= optValue %>" <% if (value == optValue) { %> selected <% } %>><%= optLabel %></option>\n        <%}); %>\n    </select>\n</div>'), 
templates["addfunds/stripe_iban_element"] = _.template('<div class="form-group" style="position: relative;">\n    <label class="control-label"><%= label %></label>\n    <div id="stripe-iban-element" class="form-control"></div>\n    <div id="stripe-iban-bank-name" style="position: absolute; right: 10px; margin-top: -30px; opacity: 0.8; z-index: 1;"></div>\n</div>'), 
templates["addfunds/stripe_card_element"] = _.template('<div class="form-group">\n    <label class="control-label" ><%= label %></label>\n    <div id="stripe-card-element" ></div>\n</div>'), 
templates["addfunds/description"] = _.template('<div class="form-group fields" id="order_<%= name %>">\n    <label class="control-label" for="field-<%= name %>"><%= label %></label>\n    <div class="panel-body border-solid border-rounded text-center"><%= value %></div>\n</div>'), 
templates["addfunds/checkbox"] = _.template('<div class="form-group fields" id="order_<%= name %>">\n    <div class="form-group__checkbox">\n        <label class="form-group__checkbox-label">\n            <input name="AddFoundsForm[fields][<%= name %>]" value="0" type="hidden"/>\n            <input name="AddFoundsForm[fields][<%= name %>]" value="1" type="checkbox" id="field-<%= name %>"/>\n            <span class="checkmark"></span>\n        </label>\n        <label for="field-<%= name %>" class="form-group__label-title">\n            <%= label %>\n        </label>\n    </div>\n</div>'), 
templates["addfunds/alert"] = _.template('<div class="alert alert-dismissible alert-danger ">\n    <button type="button" class="close" data-dismiss="alert">×</button>\n    <%= text %>\n</div>'), 
templates["addfunds/input"] = _.template('<div class="form-group fields" id="order_<%= name %>">\n    <label class="control-label" for="field-<%= name %>"><%= label %></label>\n    <input class="form-control" name="AddFoundsForm[fields][<%= name %>]" value="<%= value %>" type="text" id="field-<%= name %>"/>\n</div>'), 
templates["addfunds/stripe_payment_request_btn"] = _.template('<span id="<%= id %>" style="width: 150px; height: 18px; display: inline-block;" class="hidden"></span>'), 
templates["addfunds/hidden"] = _.template('<input class="fields" name="AddFoundsForm[fields][<%= name %>]" value="<%= value %>" type="hidden" id="field-<%= name %>"/>'), 
templates["addfunds/modal/stc_otp_token_modal"] = _.template('<div class="modal fade" id="STCPayOtpFormModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= close_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n\n            <div class="modal-body">\n                <form action="" method="POST" id="STCPayOtpForm">\n                    <input type="hidden" name="otp_ref" value="">\n                    <input type="hidden" name="pmt_ref" value="">\n\n                    <div class="form-group">\n                        <label class="control-label" for="otp-token-field"><%= otp_title %></label>\n                        <input id="otp-token-field" class="form-control" name="otp_token" autocomplete="off" />\n                    </div>\n\n                    <div id="error"></div>\n\n                    <div class="modal-footer">\n                        <button type="submit" class="btn btn-primary btn-big-primary">\n                            <%= submit_title %>\n                        </button>\n                        <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal">\n                            <%= cancel_title %>\n                        </button>\n                    </div>\n\n                </form>\n            </div>\n\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/adyen_modal"] = _.template('<div class="modal fade" id="adyenModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n            <div class="modal-body">\n                <div id="dropin-container"></div>\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/gb_prime_pay_3ds"] = _.template('<style>\n    @keyframes spinner{\n        to{transform:rotate(360deg)}\n    }\n    .spinner-block__inline{display:inline-block}\n    .spinner-block__container{display:block;width:100%;height:558px}\n    .spinner-block__wrapper{position:relative;display:flex;align-items:center;justify-content:center}\n    .spinner-block__small{width:16px;height:16px}\n    .spinner-block__small span{font-size:14px}\n    .spinner-block__medium{width:24px;height:24px}\n    .spinner-block__medium span{font-size:24px}\n    .spinner-block__high{width:42px;height:42px}\n    .spinner-block__high span{font-size:42px}\n    .spinner-block__wrapper span{animation:spinner .6s linear infinite}\n</style>\n<div class="modal fade" id="gbPrimePay3dsCardModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n            <div class="modal-body">\n                    <div id="gb-form" style="height: 558px;">\n                        <div class="spinner-block__wrapper spinner-block__container" id="gb-modal-spinner">\n                            <div class="spinner-block__wrapper spinner-block__high">\n                                <span class="fal fa-spinner-third"></span>\n                            </div>\n                        </div>\n                    </div>\n            </div>\n            <div class="modal-footer">\n                <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal"><%= close_title %></button>\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/checkout_com_card"] = _.template('<div class="modal fade" id="checkoutcomCardModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n            <form method="POST">\n                <div class="modal-body">\n                    <div class="frames-container">\n                        \x3c!-- form will be added here --\x3e\n                    </div>\n                    \x3c!-- add submit button --\x3e\n                </div>\n                <div class="modal-footer">\n                    <button type="submit" class="button-credit-card btn btn-primary">\n                        <%= submit_title %>\n                    </button>\n                    <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal">\n                        <%= cancel_title %>\n                    </button>\n                </div>\n            </form>\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/shopinext_card"] = _.template('<div class="modal fade" id="shopinextCardModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n\n            <div class="modal-body">\n                <form action="" method="POST" id="shopinextCardForm">\n                    <div id="card-error-container" class="error-summary alert alert-danger hidden"></div>\n\n                    <div class="form-group">\n                        <label class="control-label" for="card-name"><%= card_name %></label>\n                        <input id="card-name" class="form-control" name="name" autocomplete="off" maxlength="32" />\n                    </div>\n                    <div class="form-group">\n                        <label class="control-label" for="card-number"><%= card_number %></label>\n                        <input id="card-number" class="form-control" name="number" autocomplete="off" maxlength="19" />\n                    </div>\n                    <div class="form-group">\n                        <label class="control-label" for="expiration-month"><%= expiry_month %></label>\n                        <input id="expiration-month" class="form-control" name="month" autocomplete="off" maxlength="2">\n                    </div>\n                    <div class="form-group">\n                        <label class="control-label" for="expiration-year"><%= expiry_year %></label>\n                        <input id="expiration-year" class="form-control" name="year" autocomplete="off" maxlength="4">\n                    </div>\n                    <div class="form-group">\n                        <label class="control-label" for="cvv"><%= cvv %></label>\n                        <input id="cvv" class="form-control" name="cvv" autocomplete="off" maxlength="4">\n                    </div>\n\n                    <div id="error"></div>\n\n                    <div class="modal-footer">\n                        <button type="submit" class="button-credit-card btn btn-primary btn-big-primary">\n                            <%= submit_title %>\n                        </button>\n                        <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal">\n                            <%= cancel_title %>\n                        </button>\n                    </div>\n\n                </form>\n            </div>\n\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/squareup_card"] = _.template('<div class="modal fade" id="squareupCardModal" data-backdrop="static" tabindex="-1" role="dialog">\n    <div class="modal-dialog" role="document">\n        <div class="modal-content">\n            <div class="modal-header">\n                <button type="button" class="close" data-dismiss="modal" aria-label="<%= modal_title %>">\n                    <span aria-hidden="true">&times;</span>\n                </button>\n                <h4 class="modal-title"><%= modal_title %></h4>\n            </div>\n\n            <div id="form-container">\n                <div id="sq-ccbox">\n                    \x3c!--\n                      Be sure to replace the action attribute of the form with the path of\n                      the Transaction API charge endpoint URL you want to POST the nonce to\n                      (for example, "/process-card")\n                    --\x3e\n                    <form id="nonce-form" novalidate>\n                        <div class="modal-body">\n\n                            <div id="card-error-container" class="error-summary alert alert-danger hidden"></div>\n\n                            <fieldset>\n                                <div class="form-group">\n                                    <label class="control-label" for="sq-card-number"><%= card_number %></label>\n                                    <div id="sq-card-number" class="form-control"></div>\n                                </div>\n                                <div class="form-group">\n                                    <label class="control-label" for="sq-expiration-date"><%= expiration_date %></label>\n                                    <div id="sq-expiration-date" class="form-control"></div>\n                                </div>\n                                <div class="form-group">\n                                    <label class="control-label" for="sq-cvv"><%= cvv %></label>\n                                    <div id="sq-cvv" class="form-control"></div>\n                                </div>\n                                <div class="form-group">\n                                    <label class="control-label" for="sq-postal-code"><%= postal_code %></label>\n                                    <div id="sq-postal-code" class="form-control"></div>\n                                </div>\n                            </fieldset>\n\n                            <div id="error"></div>\n                            \x3c!--\n                              After a nonce is generated it will be assigned to this hidden input field.\n                            --\x3e\n                            <input type="hidden" id="card-nonce" name="nonce">\n                        </div>\n\n                        <div class="modal-footer">\n                            <button id="sq-creditcard" type="submit" class="button-credit-card btn btn-primary btn-big-primary">\n                                <%= submit_title %>\n                            </button>\n                            <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal">\n                                <%= cancel_title %>\n                            </button>\n                        </div>\n\n                    </form>\n                </div> \x3c!-- end #sq-ccbox --\x3e\n            </div> \x3c!-- end #form-container --\x3e\n\n        </div>\n    </div>\n</div>'), 
templates["addfunds/modal/qr_code_modal_canvas"] = _.template('<style>\n    @keyframes spinner{\n        to{transform:rotate(360deg)}\n    }\n    .spinner-block__inline{display:inline-block}\n    .spinner-block__container{display:block;width:100%;height:558px}\n    .spinner-block__wrapper{position:relative;display:flex;align-items:center;justify-content:center}\n    .spinner-block__small{width:16px;height:16px}\n    .spinner-block__small span{font-size:14px}\n    .spinner-block__medium{width:24px;height:24px}\n    .spinner-block__medium span{font-size:24px}\n    .spinner-block__high{width:42px;height:42px}\n    .spinner-block__high span{font-size:42px}\n    .spinner-block__wrapper span{animation:spinner .6s linear infinite}\n    #qr-code-container img{margin: auto}\n</style>\n<div class="modal fade" tabindex="-1" role="dialog" id="qr-modal" data-backdrop="static">\n    <div class="modal-dialog" role="document">\n        <form class="modal-content">\n            <div class="modal-body">\n                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n                <div class="text-center">\n                    <div class="spinner-block__wrapper spinner-block__container" id="qr-modal-spinner">\n                        <div class="spinner-block__wrapper spinner-block__high">\n                            <span class="fal fa-spinner-third"></span>\n                        </div>\n                    </div>\n\n                    <div class="center-block" id="qr-code-container"></div>\n                </div>\n            </div>\n            <div class="modal-footer">\n                <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal"><%= close_title %></button>\n            </div>\n        </form>\n    </div>\n</div>'), 
templates["addfunds/modal/qr_code_modal"] = _.template('<style>\n    @keyframes spinner{\n        to{transform:rotate(360deg)}\n    }\n    .spinner-block__inline{display:inline-block}\n    .spinner-block__container{display:block;width:100%;height:558px}\n    .spinner-block__wrapper{position:relative;display:flex;align-items:center;justify-content:center}\n    .spinner-block__small{width:16px;height:16px}\n    .spinner-block__small span{font-size:14px}\n    .spinner-block__medium{width:24px;height:24px}\n    .spinner-block__medium span{font-size:24px}\n    .spinner-block__high{width:42px;height:42px}\n    .spinner-block__high span{font-size:42px}\n    .spinner-block__wrapper span{animation:spinner .6s linear infinite}\n</style>\n<div class="modal fade" tabindex="-1" role="dialog" id="qr-modal" data-backdrop="static">\n    <div class="modal-dialog" role="document">\n        <form class="modal-content">\n            <div class="modal-body">\n                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n                <div class="text-center">\n                    <div class="spinner-block__wrapper spinner-block__container" id="qr-modal-spinner">\n                        <div class="spinner-block__wrapper spinner-block__high">\n                            <span class="fal fa-spinner-third"></span>\n                        </div>\n                    </div>\n                    <img alt="" class="img-responsive center-block" id="qr-code-image">\n                </div>\n            </div>\n            <div class="modal-footer">\n                <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal"><%= close_title %></button>\n            </div>\n        </form>\n    </div>\n</div>'), 
templates["addfunds/custom/credit_card"] = _.template('<div class="form-group fields">\n    <label class="control-label"><%= card_number.label %></label>\n    <input class="form-control" id="field-visible-<%= card_number.name %>" name="AddFoundsForm[fields][<%= card_number.name %>]" value="<%= card_number.value %>" type="text" autocomplete="off" placeholder="XXXX-XXXX-XXXX-XXXX" size="19" >\n</div>\n<div class="row">\n    <div class="col-md-4 form-group fields">\n        <label class="control-label"><%= expiry_month.label %></label>\n        <input class="form-control" id="field-visible-<%= expiry_month.name %>" name="AddFoundsForm[fields][<%= expiry_month.name %>]" value="<%= expiry_month.value %>" placeholder="MM" minlength="2" maxlength="2" type="number">\n    </div>\n    <div class="col-md-4 form-group fields">\n        <label class="control-label"><%= expiry_year.label %></label>\n        <input class="form-control" id="field-visible-<%= expiry_year.name %>" name="AddFoundsForm[fields][<%= expiry_year.name %>]" value="<%= expiry_year.value %>" placeholder="YY" minlength="2" maxlength="2" type="number">\n    </div>\n    <div class="col-md-4 form-group fields">\n        <label class="control-label"><%= cvv.label %></label>\n        <input autocomplete="on" class="form-control" id="field-visible-<%= cvv.name %>" name="AddFoundsForm[fields][<%= cvv.name %>]" value="<%= cvv.value %>" maxlength="4" type="password">\n    </div>\n</div>'), 
templates["addfunds/cryptochill_payment_request_btn"] = _.template('<button type=\'button\' id="<%= id %>" data-amount="<%= amount %>" data-product="<%= product %>" data-passthrough="<%= passthrough %>" data-currency="<%= currency %>" class="hidden btn cryptochill-button"><%= product %></button>'), 
templates["modal/confirm"] = _.template('<div class="modal fade confirm-modal" id="confirmModal" aria-labelledby="myModalLabel" tabindex="-1" data-backdrop="static">\n    <div class="modal-dialog modal-sm modal-yesno" role="document">\n        <div class="modal-content">\n            <% if (typeof(confirm_message) !== "undefined" && confirm_message != \'\') { %>\n            <div class="modal-body text-center">\n                <h5 class="mb-0"><%= title %></h5>\n            </div>\n\n            <div class="modal-body">\n                <p><%= confirm_message %></p>\n            </div>\n\n            <div class="modal-footer modal-footer__padding-10 justify-content-center">\n                <button class="btn btn-light btn-big-secondary" data-dismiss="modal" aria-hidden="true"><%= cancel_button %></button>\n                <button class="btn btn-primary btn-big-primary" id="confirm_yes"><%= confirm_button %></button>\n            </div>\n            <% } else { %>\n\n            <div class="modal-body">\n                <div class="m-b" align="center">\n                    <h4 class="m-t-0"> <%= title %></h4>\n                </div>\n\n                <div align="center">\n                    <button type="submit" class="btn btn-primary btn-big-primary" id="confirm_yes">\n                        <%= confirm_button %>\n                    </button>\n                    <button type="button" class="btn btn-default btn-big-secondary" data-dismiss="modal">\n                        <%= cancel_button %>\n                    </button>\n                </div>\n            </div>\n            <% } %>\n        </div>\n    </div>\n</div>'), 
templates["modal/alert"] = _.template('<div class="modal fade confirm-modal" id="alertModal" aria-labelledby="myModalLabel" tabindex="-1" data-backdrop="static">\n    <div class="modal-dialog modal-sm modal-yesno" role="document">\n        <div class="modal-content">\n            <% if (typeof(alert_message) !== "undefined" && alert_message != \'\') { %>\n                <div class="modal-header">\n                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n                    <h4 class="modal-title m-t-0"><%= title %></h4>\n                </div>\n\n                <div class="modal-body">\n                    <p><%= alert_message %></p>\n                </div>\n            <% } else { %>\n                <div class="modal-header">\n                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n                    <h4 class="modal-title m-t-0"><%= title %></h4>\n                </div>\n            <% } %>\n        </div>\n    </div>\n</div>'), 
templates["neworder/order_keywords"] = _.template('<div class="form-group hidden fields" id="order_keywords">\n    <label class="control-label" for="field-orderform-fields-keywords"><%= label[\'keywords\'] %></label>\n    <textarea class="form-control" name="OrderForm[keywords]" id="field-orderform-fields-keywords" cols="30" rows="10"><%= data[\'keywords\'] %></textarea>\n</div>'), 
templates["neworder/order_posts"] = _.template('<div class="form-group hidden fields" id="order_posts">\n    <label class="control-label" for="field-orderform-fields-posts"><%= label[\'new_posts\'] %></label>\n    <input class="form-control" name="OrderForm[posts]" value="<%= data[\'posts\'] %>" type="text" id="field-orderform-fields-posts"/>\n</div>'), 
templates["neworder/order_delay"] = _.template('<div class="form-group hidden fields" id="order_delay">\n    <div class="row">\n        <div class="col-md-6">\n            <label class="control-label" for="field-orderform-fields-delay"><%= label[\'delay\'] %></label>\n            <select class="form-control" name="OrderForm[delay]" id="field-orderform-fields-delay">\n                <% _.forEach(delays, function(delayLabel, delayValue) {%>\n                <option value="<%= delayValue %>" <% if (delayValue == data[\'delay\']) { %> selected <% } %>><%= delayLabel %></option>\n                <%}); %>\n            </select>\n        </div>\n        <div class="col-md-6">\n            <label for="field-orderform-fields-expiry"><%= label[\'expiry\'] %></label>\n            <div class="input-group">\n                <input class="form-control datetime" autocomplete="off" name="OrderForm[expiry]" value="<%= data[\'expiry\'] %>" type="text" id="field-orderform-fields-expiry"/>\n                <span class="input-group-btn">\n                    <button class="btn btn-default btn-big-secondary clear-datetime" type="button" data-rel="#field-orderform-fields-expiry"><span class="fa far fa-trash-alt"></span></button>\n                </span>\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["neworder/order_media_url"] = _.template('<div class="form-group hidden fields" id="order_mediaUrl">\n    <label class="control-label" for="field-orderform-fields-mediaUrl"><%= label[\'mediaurl\'] %></label>\n    <input class="form-control" name="OrderForm[mediaUrl]" value="<%= data[\'mediaUrl\'] %>" type="text" id="field-orderform-fields-mediaUrl"/>\n</div>'), 
templates["neworder/order_mention_usernames"] = _.template('<div class="form-group hidden fields" id="order_mentionUsernames">\n    <label class="control-label" for="field-orderform-fields-mentionUsernames"><%= label[\'usernames\'] %></label>\n    <textarea class="form-control" name="OrderForm[mentionUsernames]" id="field-orderform-fields-mentionUsernames" cols="30" rows="10"><%= data[\'mentionUsernames\'] %></textarea>\n</div>'), 
templates["neworder/order_link"] = _.template('<div class="form-group hidden fields" id="order_link">\n    <label class="control-label" for="field-orderform-fields-link"><%= label[\'link\'] %></label>\n    <input class="form-control" name="OrderForm[link]" value="<%= data[\'link\'] %>" type="text" id="field-orderform-fields-link"/>\n</div>'), 
templates["neworder/order_min"] = _.template('<div class="form-group hidden fields" id="order_min">\n    <label class="control-label" for="order_count"><%= label[\'quantity\'] %></label>\n    <div class="row">\n        <div class="col-md-6">\n            <input type="text" class="form-control" id="order_count" name="OrderForm[min]" value="<%= data[\'min\'] %>" placeholder="<%= label[\'min\'] %>" />\n        </div>\n\n        <div class="col-md-6">\n            <input type="text" class="form-control" id="order_count" name="OrderForm[max]" value="<%= data[\'max\'] %>" placeholder="<%= label[\'max\'] %>" />\n        </div>\n    </div>\n</div>'), 
templates["neworder/order_groups"] = _.template('<div class="form-group hidden fields" id="order_groups">\n    <label class="control-label" for="field-orderform-fields-groups"><%= label[\'groups\'] %></label>\n    <textarea class="form-control" name="OrderForm[groups]" id="field-orderform-fields-groups" cols="30" rows="10"><%= data[\'groups\'] %></textarea>\n</div>'), 
templates["neworder/order_email"] = _.template('<div class="form-group hidden fields" id="order_email">\n    <label class="control-label" for="field-orderform-fields-email"><%= label[\'email\'] %></label>\n    <input class="form-control" name="OrderForm[email]" value="<%= data[\'email\'] %>" type="text" id="field-orderform-fields-email"/>\n</div>'), 
templates["neworder/order_quantity"] = _.template('<div class="form-group hidden fields" id="order_quantity">\n    <label class="control-label" for="field-orderform-fields-quantity"><%= label[\'quantity\'] %></label>\n    <input class="form-control" name="OrderForm[quantity]" value="<%= data[\'quantity\'] %>" type="text" id="field-orderform-fields-quantity"/>\n</div>'), 
templates["neworder/order_username"] = _.template('<div class="form-group hidden fields" id="order_username">\n    <label class="control-label" for="field-orderform-fields-username"><%= label[\'username\'] %></label>\n    <input class="form-control" name="OrderForm[username]" value="<%= data[\'username\'] %>" type="text" id="field-orderform-fields-username"/>\n</div>'), 
templates["neworder/order_hashtag"] = _.template('<div class="form-group hidden fields" id="order_hashtag">\n    <label class="control-label" for="field-orderform-fields-hashtag"><%= label[\'hashtag\'] %></label>\n    <input class="form-control" name="OrderForm[hashtag]" value="<%= data[\'hashtag\'] %>" type="text" id="field-orderform-fields-hashtag"/>\n</div>'), 
templates["neworder/order_dripfeed"] = _.template('<div id="dripfeed">\n    <div class="form-group fields hidden" id="order_check">\n        <div class="form-group__checkbox">\n            <label class="form-group__checkbox-label">\n                <input name="OrderForm[check]" value="1" type="checkbox" id="field-orderform-fields-check" <% if (data[\'check\']) { %> checked <% } %> />\n                <span class="checkmark"></span>\n            </label>\n            <label for="field-orderform-fields-check" class="form-group__label-title">\n                <%= label[\'dripfeed\'] %>\n            </label>\n        </div>\n        <div class="hidden depend-fields" id="dripfeed-options" data-depend="field-orderform-fields-check">\n            <div class="form-group">\n                <label class="control-label" for="field-orderform-fields-runs"><%= label[\'dripfeed.runs\'] %></label>\n                <input class="form-control" name="OrderForm[runs]" value="<%= data[\'runs\'] %>" type="text" id="field-orderform-fields-runs" />\n            </div>\n\n            <div class="form-group">\n                <label class="control-label" for="field-orderform-fields-interval"><%= label[\'dripfeed.interval\'] %></label>\n                <input class="form-control" name="OrderForm[interval]" value="<%= data[\'interval\'] %>" type="text" id="field-orderform-fields-interval" />\n            </div>\n\n            <div class="form-group">\n                <label class="control-label" for="field-orderform-fields-total-quantity"><%= label[\'dripfeed.total.quantity\'] %></label>\n                <input class="form-control" name="OrderForm[total_quantity]" value="<%= data[\'total_quantity\'] %>" type="text" id="field-orderform-fields-total-quantity" readonly=""/>\n            </div>\n        </div>\n    </div>\n</div>'), 
templates["neworder/order_usernames_custom"] = _.template('<div class="form-group hidden fields" id="order_usernames_custom">\n    <label class="control-label" for="field-orderform-fields-usernames_custom"><%= label[\'usernames\'] %></label>\n    <textarea class="form-control" name="OrderForm[usernames_custom]" id="field-orderform-fields-usernames_custom" cols="30" rows="10"><%= data[\'usernames_custom\'] %></textarea>\n</div>'), 
templates["neworder/order_usernames"] = _.template('<div class="form-group hidden fields" id="order_usernames">\n    <label class="control-label" for="field-orderform-fields-usernames"><%= label[\'usernames\'] %></label>\n    <textarea class="form-control w-full" name="OrderForm[usernames]" id="field-orderform-fields-usernames" cols="30" rows="10"><%= data[\'usernames\'] %></textarea>\n</div>'), 
templates["neworder/order_hashtags"] = _.template('<div class="form-group hidden fields" id="order_hashtags">\n    <label class="control-label" for="field-orderform-fields-hashtags"><%= label[\'hashtags\'] %></label>\n    <textarea class="form-control" name="OrderForm[hashtags]" id="field-orderform-fields-hashtags" cols="30" rows="10"><%= data[\'hashtags\'] %></textarea>\n</div>'), 
templates["neworder/order_answer_number"] = _.template('<div class="form-group hidden fields" id="order_answer_number">\n    <label class="control-label" for="field-orderform-fields-answer_number"><%= label[\'answer_number\'] %></label>\n    <input class="form-control" name="OrderForm[answer_number]" value="<%= data[\'answer_number\'] %>" type="text" id="field-orderform-fields-answer_number"/>\n</div>'), 
templates["neworder/order_user_name"] = _.template('<div class="form-group hidden fields" id="order_user_name">\n    <label class="control-label" for="field-orderform-fields-user_name"><%= label[\'username\'] %></label>\n    <input class="form-control w-full" name="OrderForm[user_name]" value="<%= data[\'user_name\'] %>" type="text" id="field-orderform-fields-user_name"/>\n</div>'), 
templates["neworder/order_comment"] = _.template('<div class="form-group hidden fields" id="order_comment">\n    <label class="control-label" for="field-orderform-fields-comment"><%= label[\'comments\'] %></label>\n    <textarea class="form-control" name="OrderForm[comment]" id="field-orderform-fields-comment" cols="30" rows="10"><%= data[\'comment\'] %></textarea>\n</div>'), 
templates["neworder/order_comment_username"] = _.template('<div class="form-group hidden fields" id="order_comment_username">\n    <label class="control-label" for="field-orderform-fields-comment_username"><%= label[\'comment_username\'] %></label>\n    <input class="form-control" name="OrderForm[comment_username]" value="<%= data[\'username\'] %>" type="text" id="field-orderform-fields-comment_username"/>\n</div>');

var custom = new function() {
var i = this;
i.request = null, i.confirm = function(e, t, a, n) {
var o;
return o = (0, templates["modal/confirm"])($.extend({}, !0, {
confirm_button: "OK",
cancel_button: "Cancel",
width: "600px"
}, n, {
title: e,
confirm_message: t
})), $(window.document.body).append(o), $("#confirmModal").modal({}), $("#confirmModal").on("hidden.bs.modal", function(e) {
$("#confirmModal").remove();
}), $("#confirm_yes").on("click", function(e) {
return $("#confirm_yes").unbind("click"), $("#confirmModal").modal("hide"), a.call();
});
}, i.alert = function(e, t, a) {
var n;
n = (0, templates["modal/alert"])($.extend({}, !0, {
width: "600px"
}, a, {
title: e,
alert_message: t
})), $(window.document.body).append(n), $("#alertModal").modal({}), $("#alertModal").on("hidden.bs.modal", function(e) {
$("#alertModal").remove();
});
}, i.ajax = function(e) {
var t = $.extend({}, !0, e);
"object" == typeof e && (e.beforeSend = function() {
"function" == typeof t.beforeSend && t.beforeSend();
}, e.success = function(e) {
i.request = null, e.redirect && 0 < e.redirect.length ? window.location.replace(e.redirect) : "function" == typeof t.success && t.success(e);
}, null != i.request && i.request.abort(), i.request = $.ajax(e));
}, i.notify = function(e) {
var t, a;
if ($("body").addClass("bottom-right"), "object" != typeof e) return !1;
for (t in e) void 0 !== (a = $.extend({}, !0, {
type: "success",
delay: 8e3,
text: ""
}, e[t])).text && null != a.text && $.notify({
message: a.text.toString()
}, {
type: a.type,
placement: {
from: "bottom",
align: "right"
},
z_index: 2e3,
delay: a.delay,
animate: {
enter: "animated fadeInDown",
exit: "animated fadeOutUp"
}
});
}, i.sendBtn = function(t, a) {
if ("object" != typeof a && (a = {}), !t.hasClass("active")) {
var n = $.extend({}, !0, a);
if (void 0 === n.spinnerLocation && (n.spinnerLocation = t), n.spinnerLocation.addClass("has-spinner"), 
n.url = t.attr("href") || t.data("url"), void 0 !== n.type && n.type.toUpperCase() === "POST".toUpperCase() && "undefined" != typeof yii) {
var e = {};
e[yii.getCsrfParam()] = yii.getCsrfToken(), n.data = $.extend({}, n.data, e);
}
$(".spinner", n.spinnerLocation).remove(), n.spinnerLocation.prepend('<span class="spinner"><i class="fa fa-spinner fa-spin"></i></span>'), 
n.beforeSend = function() {
t.addClass("active");
}, n.success = function(e) {
t.removeClass("active"), $(".spinner", n.spinnerLocation).remove(), "success" === e.status ? "function" == typeof a.callback && a.callback(e) : "error" === e.status && ("function" == typeof a.errorCallback ? a.errorCallback(e) : i.notify({
0: {
type: "danger",
text: e.message
}
}));
}, i.ajax(n);
}
}, i.sendFrom = function(t, a, n) {
if ("object" != typeof n && (n = {}), !t.hasClass("active")) {
t.addClass("has-spinner");
var e = $.extend({}, !0, n), o = $(".error-summary", a);
e.url = a.attr("action"), e.type = "POST", $(".spinner", t).remove(), t.prepend('<span class="spinner"><i class="fa fa-spinner fa-spin"></i></span>'), 
e.beforeSend = function() {
t.addClass("active"), custom.showModalLoader(!0), o.length && (o.addClass("hidden"), 
o.html(""));
}, e.success = function(e) {
t.removeClass("active"), custom.showModalLoader(!1), $(".spinner", t).remove(), 
"success" == e.status ? "function" == typeof n.callback && n.callback(e) : "error" == e.status && (e.message && (o.length ? (o.html(e.message), 
o.removeClass("hidden")) : i.notify({
0: {
type: "danger",
text: e.message
}
})), e.errors && $.each(e.errors, function(e, t) {
a.yiiActiveForm("updateAttribute", e, t);
}), "function" == typeof n.errorCallback && n.errorCallback(e));
}, i.ajax(e);
}
}, i.generatePassword = function(e) {
void 0 === e && (e = 8);
var t, a = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", n = "", o = a.length;
for (t = 0; t < e; ++t) n += a.charAt(Math.floor(Math.random() * o));
return n;
}, i.freezeForm = function(e) {
var t, a, n = {};
return e.find("input, select, textarea").each(function() {
this.name && (t = this.name, "checkbox" === (a = $(this)).attr("type") || "radio" === a.attr("type") ? n[t] = a.prop("checked") : n[t] = a.val());
}), JSON.stringify(n);
}, i.restoreForm = function(e, t) {
var a, n, o = JSON.parse(e);
t.find("input, select, textarea").each(function() {
this.name && (a = this.name, "hidden" !== (n = $(this)).attr("type") && ("checkbox" === n.attr("type") || "radio" === n.attr("type") ? n.prop("checked", o[a]) : n.val(o[a])));
});
}, i.showModalLoader = function(e) {
$(".modal-loader").toggleClass("hidden", !e);
}, i.buildFields = function(a, e) {
var n = this, o = "";
return $.each(e, function(e, t) {
o += n.buildField(a + "_" + e, t);
}), o;
}, i.buildField = function(e, t) {
var a, n = $("<label/>", {
class: "control-label",
for: e
}).text(t.label);
return (a = "textarea" === t.type ? $("<textarea/>", {
rows: 7
}).text(t.value) : $("<input/>", {
type: "text",
value: t.value
})).attr({
id: e,
class: "form-control",
readonly: !0
}), $("<div/>", {
class: "form-group"
}).append(n).append(a).wrap("<div/>").parent().html();
}, i.isInt = function(e, t) {
var a;
return void 0 !== t && "keyup" === t.type && "-" === t.key && "-" === e || !isNaN(e) && (0 | (a = parseFloat(e))) === a;
};
}();

$(function() {
if ($('[data-toggle="tooltip"]').tooltip(), $('[data-toggle="popover"]').popover({
html: !0,
sanitize: !1
}), $(".language-editor").length && 765 < window.screen.width) {
var e = $(".language-editor__body-navbar"), t = $(".language-editor__body-container"), a = $(".language-editor__container"), n = $(document).height() - 125;
e.css("max-height", n + "px"), a.css("max-height", n - 100 + "px"), t.css("max-height", n + "px");
}
$("#dark").on("click", function(e) {
e.preventDefault();
var t = $("body"), a = !t.hasClass("dark-mode");
$("i", this).attr("class", a ? "fal fa-sun" : "fas fa-moon"), t.toggleClass("dark-mode", a), 
void 0 !== window.CodeMirrorEditor && window.CodeMirrorEditor.setOption("theme", a ? "material-darker" : "default"), 
custom.ajax({
url: "/admin/site/dark-mode?now=" + (a ? 1 : 0),
type: "GET",
success: function(e) {},
error: function(e, t, a) {
console.log("Something was wrong...", t, a, e);
}
});
});
}), function(s) {
s.fn.jQueryClearButton = function(e) {
if (!this.is(":visible")) return this;
var t = this, a = "clear-button-" + t.attr("id"), n = s.extend({
always: !1,
zindex: 0,
offset_right: 7,
button_width: 15,
button_height: 18,
color: "#aaa"
}, e);
s("body").append("<style> input::-ms-clear { visibility:hidden; } </style>");
var o = s('<div style="position:relative; margin:0; padding:0; border:none;">');
this.before(o), this.prependTo(o);
var i = s('<div class="fa fa-times ' + a + '"></div>');
this.before(i), i.css({
position: "absolute",
display: "none",
cursor: "pointer",
"z-index": n.zindex,
width: n.button_width + "px",
height: n.button_height + "px",
color: n.color
});
var r = o.height();
r || (r = t.height());
var l = r / 2 - n.button_height / 2 + 2;
return i.css({
top: l + "px",
right: n.offset_right + "px"
}), i.on("click", function() {
t.val("").focus(), n.always || i.hide();
}), t.on("input", function() {
t.val() ? i.show() : n.always || i.hide();
}), n.always ? i.show() : (t.on("focus", function() {
t.val() ? i.show() : i.hide();
}), t.on("blur", function() {
setTimeout("$('." + a + "').hide()", 200);
}), t.on("mouseover", function() {
t.val() ? i.show() : i.hide();
})), this;
};
}(jQuery), function() {
var t = function(e) {
return new RegExp("(^| )" + e + "( |$)");
}, e = function(e, t, a) {
for (var n = 0; n < e.length; n++) t.call(a, e[n]);
};
function a(e) {
this.element = e;
}
a.prototype = {
add: function() {
e(arguments, function(e) {
this.contains(e) || (this.element.className += " " + e);
}, this);
},
remove: function() {
e(arguments, function(e) {
this.element.className = this.element.className.replace(t(e), "");
}, this);
},
toggle: function(e) {
return this.contains(e) ? (this.remove(e), !1) : (this.add(e), !0);
},
contains: function(e) {
return t(e).test(this.element.className);
},
replace: function(e, t) {
this.remove(e), this.add(t);
}
}, "classList" in Element.prototype || Object.defineProperty(Element.prototype, "classList", {
get: function() {
return new a(this);
}
}), window.DOMTokenList && null == DOMTokenList.prototype.replace && (DOMTokenList.prototype.replace = a.prototype.replace);
}(), function(n, a) {
function e(e) {
var t = a[e];
a[e] = function(e) {
return i(t(e));
};
}
function o(e, t, a) {
return (a = this).attachEvent("on" + e, function(e) {
(e = e || n.event).preventDefault = e.preventDefault || function() {
e.returnValue = !1;
}, e.stopPropagation = e.stopPropagation || function() {
e.cancelBubble = !0;
}, t.call(a, e);
});
}
function i(e, t) {
if (t = e.length) for (;t--; ) e[t].addEventListener = o; else e.addEventListener = o;
return e;
}
n.addEventListener || (i([ a, n ]), "Element" in n ? n.Element.prototype.addEventListener = o : (a.attachEvent("onreadystatechange", function() {
i(a.all);
}), e("getElementsByTagName"), e("getElementById"), e("createElement"), i(a.all)));
}(window, document), window.initCheckAll = function() {
if (document.querySelector(".checkAll")) {
var n = document.querySelector(".checkAll"), o = n.parentNode.parentNode, i = document.querySelectorAll(".selectOrder"), r = document.getElementById("checkAllText").value, l = document.querySelector(".countOrders"), s = 0;
function e() {
for (var e = !1, t = s = 0; t < i.length; t++) {
var a = i[t].parentNode.parentNode;
i[t].checked ? (s++, e = !0, a.classList.add("active")) : a.classList.remove("active");
}
return e ? (n.checked = !0, l.innerText = 1 == s ? s + " " + r + " " : s + " " + r + "s ", 
o.classList.add("show-action-menu"), !0) : (n.checked = !1, o.classList.remove("show-action-menu"), 
!1);
}
n.addEventListener ? n.addEventListener("change", function() {
if (s = 0, this.checked) {
for (var e = 0; e < i.length; e++) i[e].disabled || (i[e].parentNode.parentNode.classList.add("active"), 
o.classList.add("show-action-menu"), i[e].checked = !0, s++);
l.innerText = s + " " + r + "s ";
} else {
for (e = 0; e < i.length; e++) i[e].parentNode.parentNode.classList.remove("active"), 
o.classList.remove("show-action-menu"), i[e].checked = !1;
s = 0, this.checked = !1, l.innerText = "";
}
}) : n.attachEvent && n.attachEvent("onchange", e);
for (var t = 0; t < i.length; t++) i[t].addEventListener ? i[t].addEventListener("change", e) : i[t].attachEvent && i[t].attachEvent("onchange", e);
}
}, window.initCheckAll(), $(document).ready(function() {
var e = $("#public-page");
if (e) {
var t = function() {
var e = $("#public-page").val(), t = $("#seo-block");
parseInt(e, 10) ? t.show() : t.hide();
};
t(), e.on("change", function() {
t();
});
}
BreakpointSwitcher.create({
"768px": function(e) {
e ? window.navPriority('[data-nav="navbar-priority"]', {
containerSelector: null,
containerWidthOffset: 310,
dropdownLabel: '<span class="fa fa-ellipsis-v"></span>'
}) : window.navPriority('[data-nav="navbar-priority"]', "destroy");
}
});
}), function(e, t, a) {
"use strict";
var n = {
throttle: function(n, o, i) {
var r, l;
return o || (o = 250), function() {
var e = i || this, t = +new Date(), a = arguments;
r && t < r + o ? (clearTimeout(l), l = setTimeout(function() {
r = t, n.apply(e, a);
}, o)) : (r = t, n.apply(e, a));
};
},
debounce: function(a, n) {
var o = null;
return function() {
var e = this, t = arguments;
clearTimeout(o), o = setTimeout(function() {
a.apply(e, t);
}, n);
};
},
extend: function() {
for (var e = 1; e < arguments.length; e++) for (var t in arguments[e]) arguments[e].hasOwnProperty(t) && (arguments[0][t] = arguments[e][t]);
return arguments[0];
},
isElement: function(e) {
return !(!e || 1 !== e.nodeType);
},
hasClass: function(e, t) {
return -1 < e.className.indexOf(t);
},
isSmallScreen: function() {
return e.innerWidth <= this.options.navBreakpoint;
},
handleResize: function() {
n.throttle(this.reflowNavigation.bind(this), delay), n.debounce(this.reflowNavigation.bind(this), delay);
var e = this.isSmallScreen(), t = !1;
if (!this.smallScreen && !e || this.smallScreen && e || (this.smallScreen = e, t = !0), 
!t) return !1;
}
};
e.Util = n;
}(window, document), window.matchMedia = window.matchMedia || function(r, e) {
var a = r.documentElement, t = a.firstElementChild || a.firstChild, n = r.createElement("body"), o = r.createElement("div");
o.id = "mq-test-1", o.style.cssText = "position:absolute;top:-100em", n.style.background = "none", 
n.appendChild(o);
var l, s = function(e) {
return o.innerHTML = '&shy;<style media="' + e + '"> #mq-test-1 { width: 42px; }</style>', 
a.insertBefore(n, t), bool = 42 === o.offsetWidth, a.removeChild(n), {
matches: bool,
media: e
};
}, d = function() {
var e = a.body, t = !1;
return o.style.cssText = "position:absolute;font-size:1em;width:1em", e || ((e = t = r.createElement("body")).style.background = "none"), 
e.appendChild(o), a.insertBefore(e, a.firstChild), t ? a.removeChild(e) : e.removeChild(o), 
l = parseFloat(o.offsetWidth);
}, c = s("(min-width: 0px)").matches;
return function(e) {
if (c) return s(e);
var t = e.match(/\(min\-width:[\s]*([\s]*[0-9\.]+)(px|em)[\s]*\)/) && parseFloat(RegExp.$1) + (RegExp.$2 || ""), a = e.match(/\(max\-width:[\s]*([\s]*[0-9\.]+)(px|em)[\s]*\)/) && parseFloat(RegExp.$1) + (RegExp.$2 || ""), n = null === t, o = null === a, i = r.body.offsetWidth;
return t && (t = parseFloat(t) * (-1 < t.indexOf("em") ? l || d() : 1)), a && (a = parseFloat(a) * (-1 < a.indexOf("em") ? l || d() : 1)), 
bool = (!n || !o) && (n || t <= i) && (o || i <= a), {
matches: bool,
media: e
};
};
}(document);

var BreakpointSwitcher = function(t, a, n, e, o) {
"use strict";
var i = function(e) {
this.breakpoints = a.extend({}, "object" == typeof e && e), this.currentView = null, 
t.addEventListener("resize", a.throttle(this.switch, 20, this)), t.addEventListener("load", a.throttle(this.switch, 20, this));
};
return i.create = function(e) {
if (!n) throw new Error("matchMedia is required for BreakpointSwitcher");
if ("object" == typeof e) return new i(e);
throw new Error("Options object has to be passed to the constructor");
}, i.prototype.matchView = function(e) {
var t = null;
for (var a in e) n("(min-width: " + a + ")").matches && (t = e[a]);
return t;
}, i.prototype.switch = function() {
var e = this.matchView(this.breakpoints);
return this.currentView !== e ? (this.currentView && "function" == typeof this.currentView && this.currentView.call(t, !1), 
"function" == typeof e && e.call(t, !0), this.currentView = e) : null;
}, i;
}(window, window.Util, window.matchMedia, document);

!function(a, s, d, e) {
"use strict";
var c = [], m = function(e, t) {
this.options = t, this.element = "string" == typeof e ? d.querySelector(e) : e, 
this.resizeListener = null, this.container = this.options.containerSelector ? this.element.querySelectorAll(this.options.containerSelector)[0] : this.element, 
this.navList = this.element.querySelectorAll("ul")[0], this.overflowMenu = this.createOverflowMenu(), 
this.overflowList = this.overflowMenu.querySelectorAll("ul")[0], this.overflowDropdown = this.element.parentNode.querySelector("[data-nav-priority-toggle]"), 
this.overflowBreakpoints = [], this.elementStyle = a.getComputedStyle(this.element), 
this.breakpoints = this.getBreakpoints(), this.setupEventListeners(), this.reflowNavigation();
};
m.DEFAULTS = {
dropdownLabel: 'More <i class="caret"></i>',
dropdownMenuClass: "dropdown-menu dropdown-menu-right",
dropdownMenuTemplate: '<li data-nav-priority-menu class="navbar-nav-more dropdown" aria-hidden="true"><a id="{{dropdownMenuId}}" href="#" class="navbar-toggle-more" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" data-nav-priority-toggle>{{dropdownLabel}}</a><ul class="{{dropdownMenuClass}}" aria-labelledby="{{dropdownMenuId}}"></ul></li>',
containerSelector: "ul",
containerWidthOffset: 10,
threshold: 4
}, m.create = function(e, t) {
var a = e.querySelectorAll("li"), n = !0;
if (!s.isElement(e)) throw n = !1, new Error("element has to be DOM Element");
return (0 === a.length || a.length <= t.threshold) && (n = !1), n ? new m(e, t) : null;
}, m.prototype.createOverflowMenu = function() {
var e = this.navList.querySelector("[data-nav-priority-menu]");
if (!e) {
var t, a = "nav-link-more-" + c.length, n = this.options.dropdownMenuTemplate, o = this.navList.children[this.navList.children.length - 1];
n = n.replace("{{dropdownLabel}}", this.options.dropdownLabel).replace("{{dropdownMenuClass}}", this.options.dropdownMenuClass).replace(new RegExp("{{dropdownMenuId}}", "g"), a), 
(t = d.createElement("div")).innerHTML = n, o.setAttribute("class", o.className + " is-last"), 
this.navList.appendChild(t.firstChild), e = this.navList.querySelector("[data-nav-priority-menu]");
}
if (!e) throw new Error("overflowMenu does not exist, check your custom dropdownMenuTemplate parameter");
return e;
}, m.prototype.getBreakpoints = function() {
for (var e = [], t = this.navList.children, a = t.length, n = Math.ceil(this.overflowDropdown.getBoundingClientRect().width), o = n, i = 0; i < a; i++) {
var r = t[i];
s.hasClass(r, "navbar-nav-more") || (o += Math.ceil(r.getBoundingClientRect().width), 
e.push(o));
}
return e[e.length - 1] -= n, e;
}, m.prototype.setupEventListeners = function() {
this.resizeListener = s.throttle(this.reflowNavigation, 10, this), a.addEventListener("resize", this.resizeListener);
}, m.prototype.addToOverflow = function(e, t) {
return this.overflowList.insertBefore(e, this.overflowList.firstChild), this.overflowBreakpoints.unshift(t), 
this.breakpoints.pop(), this.overflowBreakpoints;
}, m.prototype.removeFromOverflow = function(e, t) {
return this.breakpoints.push(t), this.overflowBreakpoints.shift(), this.navList.insertBefore(e, this.overflowDropdown.parentNode), 
this.overflowBreakpoints;
}, m.prototype.toggleOverflowDropdown = function(e) {
return this.overflowMenu.setAttribute("aria-hidden", e);
}, m.prototype.reflowNavigation = function() {
if (!this.resizeListener) return !1;
for (var e = Math.ceil(this.container.getBoundingClientRect().width - this.options.containerWidthOffset), t = this.navList.children, a = t.length; a--; ) if (!s.hasClass(t[a], "navbar-nav-more")) {
var n = this.breakpoints[a];
e <= n && this.addToOverflow(t[a], n);
}
for (var o = this.overflowList.children.length; o--; ) this.overflowBreakpoints[0] < e && this.removeFromOverflow(this.overflowList.children[0], this.overflowBreakpoints[0]);
this.toggleOverflowDropdown(0 == this.overflowList.children.length);
}, m.prototype.destroy = function() {
if (this.element.removeAttribute("data-nav-priority"), a.removeEventListener("resize", this.resizeListener), 
this.resizeListener = null, this.overflowList.children.length) for (;this.overflowList.children.length; ) this.removeFromOverflow(this.overflowList.children[0], this.overflowBreakpoints[0]);
return this.toggleOverflowDropdown(0 == this.overflowList.children.length), this.element;
}, a.navPriority = function(e, t) {
var a = d.querySelectorAll(e);
if ("string" == typeof t && "destroy" == t) {
for (var n = 0; n < c.length; n++) {
(o = c[n]).destroy.call(o);
}
c = [];
}
if ("string" != typeof t) for (n = 0; n < a.length; n++) {
var o, i = a[n], r = s.extend({}, m.DEFAULTS, "object" == typeof t && t);
if (!(o = i.getAttribute("data-nav-priority"))) {
var l = m.create(i, r);
c.push(l), o = i.setAttribute("data-nav-priority", !0);
}
}
return c;
};
}(window, window.Util, document), customModule.accountController = {
run: function(e) {
if (e.action && e.passwd) {
var a = $("#yw0"), n = $(".modal-loader", a);
n.removeClass("hidden"), custom.ajax({
url: e.action,
data: {
passwd: e.passwd
},
type: "POST",
success: function(e) {
var t = $(e);
$(".alert", t).each(function() {
a.prepend($(this).get(0).outerHTML);
}), n.addClass("hidden"), t = void 0;
},
error: function(e, t, a) {
n.addClass("hidden"), console.log("Something was wrong...", t, a, e);
}
});
}
}
}, customModule.adminApiController = {
run: function(e) {
var t;
$(".navbar-fixed-top").hide(), $(function() {
$('[data-toggle="tooltip"]').tooltip();
}), $(window).scroll(function() {
var e = $(".method-title");
if (0 == $(window).scrollTop() && $("#documentation-nav li").removeClass("active"), 
$(window).scrollTop() == $(document).height() - $(window).height()) $("#documentation-nav li").removeClass("active"), 
$("#list-method-addpayment").addClass("active"); else for (var t = 0; t < e.length; t++) $(e[t]).offset().top <= $(window).scrollTop() + 25 && ($("#documentation-nav li").removeClass("active"), 
$("#list-" + e[t].id).addClass("active"));
}), $(document).ready(function() {
$("#documentation-nav").on("click", "a", function(e) {
e.preventDefault();
var t = $(this).attr("href"), a = $(t).offset().top - 10;
$("body,html").animate({
scrollTop: a
}, 500);
});
}), $(document).ready(function() {
$("#documentation-nav").sticky({
topSpacing: 15
});
}), t = function(m) {
var t = Array.prototype.slice, n = Array.prototype.splice, l = {
topSpacing: 0,
bottomSpacing: 0,
className: "is-sticky",
wrapperClassName: "sticky-wrapper",
center: !1,
getWidthFrom: "",
widthFromWrapper: !0,
responsiveWidth: !1,
zIndex: "inherit"
}, u = m(window), p = m(document), f = [], h = u.height(), e = function() {
for (var e = u.scrollTop(), t = p.height(), a = t - h, n = a < e ? a - e : 0, o = 0, i = f.length; o < i; o++) {
var r = f[o], l = r.stickyWrapper.offset().top - r.topSpacing - n;
if (r.stickyWrapper.css("height", r.stickyElement.outerHeight()), e <= l) null !== r.currentTop && (r.stickyElement.css({
width: "",
position: "",
top: "",
"z-index": ""
}), r.stickyElement.parent().removeClass(r.className), r.stickyElement.trigger("sticky-end", [ r ]), 
r.currentTop = null); else {
var s, d = t - r.stickyElement.outerHeight() - r.topSpacing - r.bottomSpacing - e - n;
if (d < 0 ? d += r.topSpacing : d = r.topSpacing, r.currentTop !== d) r.getWidthFrom ? (padding = r.stickyElement.innerWidth() - r.stickyElement.width(), 
s = m(r.getWidthFrom).width() - padding || null) : r.widthFromWrapper && (s = r.stickyWrapper.width()), 
null == s && (s = r.stickyElement.width()), r.stickyElement.css("width", s).css("position", "fixed").css("top", d).css("z-index", r.zIndex), 
r.stickyElement.parent().addClass(r.className), null === r.currentTop ? r.stickyElement.trigger("sticky-start", [ r ]) : r.stickyElement.trigger("sticky-update", [ r ]), 
r.currentTop === r.topSpacing && r.currentTop > d || null === r.currentTop && d < r.topSpacing ? r.stickyElement.trigger("sticky-bottom-reached", [ r ]) : null !== r.currentTop && d === r.topSpacing && r.currentTop < d && r.stickyElement.trigger("sticky-bottom-unreached", [ r ]), 
r.currentTop = d;
var c = r.stickyWrapper.parent();
r.stickyElement.offset().top + r.stickyElement.outerHeight() >= c.offset().top + c.outerHeight() && r.stickyElement.offset().top <= r.topSpacing ? r.stickyElement.css("position", "absolute").css("top", "").css("bottom", 0).css("z-index", "") : r.stickyElement.css("position", "fixed").css("top", d).css("bottom", "").css("z-index", r.zIndex);
}
}
}, a = function() {
h = u.height();
for (var e = 0, t = f.length; e < t; e++) {
var a = f[e], n = null;
a.getWidthFrom ? a.responsiveWidth && (n = m(a.getWidthFrom).width()) : a.widthFromWrapper && (n = a.stickyWrapper.width()), 
null != n && a.stickyElement.css("width", n);
}
}, s = {
init: function(r) {
return this.each(function() {
var e = m.extend({}, l, r), t = m(this), a = t.attr("id"), n = a ? a + "-" + l.wrapperClassName : l.wrapperClassName, o = m("<div></div>").attr("id", n).addClass(e.wrapperClassName);
t.wrapAll(function() {
if (0 == m(this).parent("#" + n).length) return o;
});
var i = t.parent();
e.center && i.css({
width: t.outerWidth(),
marginLeft: "auto",
marginRight: "auto"
}), "right" === t.css("float") && t.css({
float: "none"
}).parent().css({
float: "right"
}), e.stickyElement = t, e.stickyWrapper = i, e.currentTop = null, f.push(e), s.setWrapperHeight(this), 
s.setupChangeListeners(this);
});
},
setWrapperHeight: function(e) {
var t = m(e), a = t.parent();
a && a.css("height", t.outerHeight());
},
setupChangeListeners: function(t) {
window.MutationObserver ? new window.MutationObserver(function(e) {
(e[0].addedNodes.length || e[0].removedNodes.length) && s.setWrapperHeight(t);
}).observe(t, {
subtree: !0,
childList: !0
}) : window.addEventListener ? (t.addEventListener("DOMNodeInserted", function() {
s.setWrapperHeight(t);
}, !1), t.addEventListener("DOMNodeRemoved", function() {
s.setWrapperHeight(t);
}, !1)) : window.attachEvent && (t.attachEvent("onDOMNodeInserted", function() {
s.setWrapperHeight(t);
}), t.attachEvent("onDOMNodeRemoved", function() {
s.setWrapperHeight(t);
}));
},
update: e,
unstick: function(e) {
return this.each(function() {
for (var e = m(this), t = -1, a = f.length; 0 < a--; ) f[a].stickyElement.get(0) === this && (n.call(f, a, 1), 
t = a);
-1 !== t && (e.unwrap(), e.css({
width: "",
position: "",
top: "",
float: "",
"z-index": ""
}));
});
}
};
window.addEventListener ? (window.addEventListener("scroll", e, !1), window.addEventListener("resize", a, !1)) : window.attachEvent && (window.attachEvent("onscroll", e), 
window.attachEvent("onresize", a)), m.fn.sticky = function(e) {
return s[e] ? s[e].apply(this, t.call(arguments, 1)) : "object" != typeof e && e ? void m.error("Method " + e + " does not exist on jQuery.sticky") : s.init.apply(this, arguments);
}, m.fn.unstick = function(e) {
return s[e] ? s[e].apply(this, t.call(arguments, 1)) : "object" != typeof e && e ? void m.error("Method " + e + " does not exist on jQuery.sticky") : s.unstick.apply(this, arguments);
}, m(function() {
setTimeout(e, 0);
});
}, "function" == typeof define && define.amd ? define([ "jquery" ], t) : "object" == typeof module && module.exports ? module.exports = t(require("jquery")) : t(jQuery);
}
}, customModule.affiliatesController = {
run: function(n) {
$(".js_action").click(function(e) {
e.preventDefault();
var t = $(this), a = t.data("params");
custom.confirm(n.confirm_message, "", function() {
return custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
});
}
}, customModule.apiDoc = {
run: function(e) {
var t = document.querySelector(".api");
if (null != t) var a = window.setInterval(function() {
"undefined" != typeof Redoc && (Redoc.init(t.getAttribute("src"), {
theme: {
colors: {
primary: {
main: "#007AFF"
}
},
typography: {
fontFamily: "Roboto, sans-serif",
fontWeightRegular: "400",
fontWeightLight: "400",
fontWeightBold: "700",
headings: {
fontFamily: '"Basier Square" ,sans-serif'
}
},
rightPanel: {
backgroundColor: "#39383d"
}
}
}, t), window.clearInterval(a));
}, 500);
}
}, customModule.appearanceEditPageController = {
run: function(t) {
var a = $(".is-public"), n = $(".seo-keywords"), o = t.formName.toLowerCase();
if ($(".delete-btn").click(function(e) {
e.preventDefault();
var t = $(this), a = t.data("title");
custom.confirm(a, "", function() {
return custom.sendBtn(t, {
type: "POST",
callback: function(e) {
e && e.redirect ? window.location.href = e.redirect : location.reload();
}
}), !1;
});
}), "createblogform" !== o && "editblogform" !== o ? $(".content").summernote({
height: 40 * window.innerHeight / 100,
focus: !0,
toolbar: [ [ "style", [ "style", "bold", "italic" ] ], [ "lists", [ "ul", "ol" ] ], [ "para", [ "paragraph" ] ], [ "color", [ "forecolor", "backcolor", "clear" ] ], [ "insert", [ "link", "picture", "video" ] ], [ "codeview", [ "codeview" ] ] ],
disableDragAndDrop: !0,
styleTags: [ "p", "h1", "h2", "h3", "h4", "h5", "h6" ],
popover: {
image: [ [ "custom", [ "imageAttributes" ] ], [ "imagesize", [ "imageSize100", "imageSize50", "imageSize25" ] ], [ "float", [ "floatLeft", "floatRight", "floatNone" ] ], [ "remove", [ "removeMedia" ] ] ]
},
dialogsFade: !0,
imageAttributes: {
icon: '<i class="note-icon-pencil"/>',
removeEmpty: !0,
disableUpload: !0
}
}) : $(".content").summernote({
height: 40 * window.innerHeight / 100,
focus: !0,
toolbar: [ [ "style", [ "style", "bold", "italic", "underline" ] ], [ "fontname", [ "fontname" ] ], [ "lists", [ "ul", "ol" ] ], [ "para", [ "paragraph" ] ], [ "color", [ "forecolor", "backcolor", "clear" ] ], [ "insert", [ "link", "picture", "video" ] ], [ "insert", [ "shorthr" ] ], [ "codeview", [ "codeview" ] ] ],
disableDragAndDrop: !0,
callbacks: {
onChange: function(e) {
-1 === e.indexOf('class="shorthr"') && $(this).next().find(".btn-shorthr-disabled").length && $(this).next().find(".btn-shorthr-disabled").removeClass("btn-shorthr-disabled");
}
},
fontNames: [ "Serif", "Sans", "Arial", "Arial Black", "Courier", "Courier New", "Comic Sans MS", "Helvetica", "Impact", "Lucida Grande", "Sacramento" ],
styleTags: [ "p", "h1", "h2", "h3", "h4", "h5", "h6" ],
popover: {
image: [ [ "custom", [ "imageAttributes" ] ], [ "imagesize", [ "imageSize100", "imageSize50", "imageSize25" ] ], [ "float", [ "floatLeft", "floatRight", "floatNone" ] ], [ "remove", [ "removeMedia" ] ] ]
},
dialogsFade: !0,
imageAttributes: {
icon: '<i class="note-icon-pencil"/>',
removeEmpty: !0,
disableUpload: !0
}
}), $(".content-rtl").summernote({
height: 40 * window.innerHeight / 100,
focus: !0,
toolbar: [ [ "style", [ "style", "bold", "italic" ] ], [ "lists", [ "ul", "ol" ] ], [ "para", [ "paragraph" ] ], [ "color", [ "forecolor", "backcolor", "clear" ] ], [ "insert", [ "link", "picture", "video" ] ], [ "codeview", [ "codeview" ] ] ],
disableDragAndDrop: !0,
styleTags: [ "p", "h1", "h2", "h3", "h4", "h5", "h6" ],
popover: {
image: [ [ "custom", [ "imageAttributes" ] ], [ "imagesize", [ "imageSize100", "imageSize50", "imageSize25" ] ], [ "float", [ "floatLeft", "floatRight", "floatNone" ] ], [ "remove", [ "removeMedia" ] ] ]
},
dialogsFade: !0,
imageAttributes: {
icon: '<i class="note-icon-pencil"/>',
removeEmpty: !0,
disableUpload: !0
},
onMediaDelete: function(e, t, a) {
console.log("log");
}
}), n.length) {
var i = document.querySelector(".seo-keywords");
function r(e) {
for (var t = "", a = 0; a < e.length; a++) "" === t ? t = e[a].value : t += "," + e[a].value;
n.val(t);
}
new Tagify(i, {}).on("add", function(e) {
r(JSON.parse(i.value));
}).on("remove", function(e) {
r(JSON.parse(i.value));
});
}
if (a.length && "createblogform" !== o && "editblogform" !== o) {
a.on("change", function() {
!function() {
var e = a.val(), t = $("#seo-block-container");
parseInt(e, 10) ? t.show() : t.hide();
}();
}), a.trigger("change");
}
BreakpointSwitcher.create({
"768px": function(e) {
e ? window.navPriority('[data-nav="navbar-priority"]', {
containerSelector: null,
containerWidthOffset: 180,
dropdownLabel: '<span class="fa fa-ellipsis-v"></span>'
}) : window.navPriority('[data-nav="navbar-priority"]', "destroy");
}
});
var l = !1, s = !1;
$("#" + o + "-url").on("input", function(e, t) {
if (a = $(this).val(), t) {
if ("createblogform" == o) {
var a = d.generateUrl($(this).val());
$(this).val(a);
}
} else l = !0;
$(".edit-seo__url").text(a);
}), $("#" + o + "-seo_description").on("input", function(e) {
$(".seo-preview__description").text($(this).val());
}), $("#" + o + "-seo_title").on("input", function(e, t) {
t || (s = !0), $(".seo-preview__title").text($(this).val());
});
var d = this;
"create" === t.mode && $(".default-page-name").on("blur", function(e) {
var t = $(this).val();
if (!l) {
var a = $("#" + o + "-url");
a.val(d.filterUrl(t)), a.trigger("input", !0);
}
if (!s) {
var n = $("#" + o + "-seo_title");
n.val(t), n.trigger("input", !0);
}
}), $("#" + t.formName + " input").on("keyup", function(e) {
13 === (e.keyCode || e.which) && $("#" + t.formName).submit();
}), $("#createPageForm, #createBlogForm").submit(function(e) {
var t = $(".content");
t.summernote("codeview.isActivated") && t.summernote("codeview.deactivate"), (t.summernote("isEmpty") || "<p><br></p>" === t.val()) && t.val("");
}), $("input:file").on("change", function() {
var t = $(this).attr("data-target");
if (this.files && this.files[0]) {
var e = new FileReader();
e.onload = function(e) {
$(t).attr("src", e.target.result);
}, $(t).parent().find(".setting-block__image-remove").addClass("hidden"), $(t).closest(".image_container").removeClass("hidden"), 
e.readAsDataURL(this.files[0]);
}
}), $(".delete_image_action").click(function(e) {
var t = $(this).attr("href"), n = $(this).closest(".image_container").find(".modal-loader"), a = $(this).closest(".setting-block__image-remove"), o = $(this);
e.preventDefault(), n.removeClass("hidden"), a.addClass("hidden");
var i = {
blog_id: o.data("blog-id")
};
custom.ajax({
url: t,
data: i,
type: "POST",
success: function(e, t, a) {
o.closest(".image_container").addClass("hidden"), n.addClass("hidden"), location.reload();
},
error: function(e, t, a) {
o.closest(".image_container").addClass("hidden"), n.addClass("hidden"), location.reload();
}
});
});
},
filterUrl: function(e) {
return (e.match(/[a-zA-Z0-9-]+/g) || []).join("").toLowerCase();
},
generateUrl: function(e) {
var t = e;
return custom.ajax({
url: "/admin/appearance/exist-post-url?url=" + e,
async: !1,
method: "GET",
success: function(e) {
"success" == e.status && (t = e.data.url);
}
}), t;
}
}, customModule.appearanceFilesController = {
run: function(e) {
var a, t = $("#searchForm"), n = $("#filesContainer"), o = (a = 0, function(e, t) {
clearTimeout(a), a = setTimeout(e, t);
});
$('[data-toggle="tooltip"]').tooltip({
trigger: "click"
}), $("input", t).on("keyup", function(e) {
o(function(e) {
custom.ajax({
url: t.attr("action"),
data: t.serialize(),
type: "GET",
success: function(e) {
n.removeClass("page-loader").html(e.content), $('[data-toggle="tooltip"]').tooltip({
trigger: "click"
});
}
});
}, 500);
}), $(document).on("change", "#upload", function(e) {
return e.preventDefault(), $("#uploadForm").submit(), !1;
}), $(document).on("click", "a[name=copy_pre]", function(e) {
e.preventDefault(), $(this).tooltip("toggle"), $('[data-toggle="tooltip"]').not(this).tooltip("hide");
var t = $(this).attr("data-for-clip"), a = document.getElementById(t), n = document.createRange();
n.selectNodeContents(a);
var o = window.getSelection();
o.removeAllRanges(), o.addRange(n), document.execCommand("copy"), window.getSelection().removeRange(n), 
setTimeout(function() {
$($(this)).tooltip("hide");
}, 1e3);
}), $(document).on("click", ".delete-file", function(e) {
e.preventDefault();
var t = $(this), a = t.data("name"), n = $("#deleteFileModal"), o = $("#deleteFileForm", n);
return $("#fileName", n).text(a), o.attr("action", t.attr("href")), n.modal("show"), 
!1;
}), $("#deleteFileForm").submit(function(e) {
e.preventDefault();
var t = $(this), a = $("#deleteFileSubmit");
return custom.sendFrom(a, t, {
data: t.serialize(),
callback: function() {
location.reload();
}
}), !1;
});
}
}, customModule.appearancePagesController = {
run: function(e) {
$(document).on("change", ".toggle-page-visibility", function(e) {
e.preventDefault();
var t = $(this);
return custom.ajax({
method: "POST",
url: t.data("action"),
success: function(e) {
if ("error" == e.status) return t.prop("checked", !t.prop("checked")), !1;
t.parents("tr").toggleClass("grey");
}
}), !1;
}), $(".toggle-page-visibility").removeAttr("disabled");
}
}, customModule.childPanelsController = {
run: function(n) {
$(".js_action").click(function(e) {
e.preventDefault();
var t = $(this), a = t.data("params");
custom.confirm(n.confirm_message, "", function() {
return custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
});
}
}, customModule.deferredLoadController = {
processing: !1,
load: function(n) {
var o = this;
null === custom.request && custom.ajax({
url: n.queueLink,
type: "GET",
success: function(e) {
if ("success" === e.status) {
var t = "string" == typeof e.data;
if (o.$targetBlock.html(t ? e.data : e.data.html), o.clear(), void 0 !== n.afterLoad) {
var a = "";
t || void 0 !== e.data.afterLoadParams && (a = JSON.stringify(e.data.afterLoadParams)), 
new Function(n.afterLoad.replace("#PARAMS#", a))();
}
o.$targetBlock.data("loaded", !0), o.$targetBlock = null;
}
},
error: function(e, t, a) {
t && "abort" === t.toLowerCase() || (console.log("Something was wrong...", t, a, e), 
o.stop(), o.$targetBlock = null, custom.notify({
0: {
type: "danger",
delay: 0,
text: a
}
}));
}
});
},
run: function(t) {
var a = this;
return a.interval = null, a.queueDataWaitTimer = null, a.nainTimer = null, a.$targetBlock = null, 
a.processing = !0, t.queueLink && t.targetBlock && 0 < t.userRequestInterval && (a.$targetBlock = $(t.targetBlock), 
a.mainTimer = setTimeout(function() {
if (a.interval = setInterval(function() {
a.load(t);
}, 1e3 * parseInt(t.userRequestInterval)), void 0 !== t.queueDataWaitTime) {
var e = parseInt(t.queueDataWaitTime) - 1;
e = 0 <= e ? e : 0, a.queueDataWaitTimer = setTimeout(function() {
a.stop(), a.$targetBlock = null, custom.notify({
0: {
type: "danger",
delay: 0,
text: "Error loading page. Please refresh the page."
}
});
}, 1e3 * e);
}
a.load(t);
}, 1e3)), a;
},
clear: function() {
this.interval && clearInterval(this.interval), this.queueDataWaitTimer && clearTimeout(this.queueDataWaitTimer), 
this.interval = null, this.queueDataWaitTimer = null, this.processing = !1;
},
stop: function() {
this.mainTimer && clearTimeout(this.mainTimer), this.mainTimer = null, this.clear();
}
}, customModule.docsController = {
run: function(e) {
$(document).ready(function() {
$(".link-anchor").on("click", function(e) {
e.preventDefault();
var t = $(this).attr("href"), a = $(t).offset().top - 60;
$("body,html").animate({
scrollTop: a
}, 500);
});
});
}
}, customModule.dripFeedController = {
run: function(n) {
$(".js_action").click(function(e) {
e.preventDefault();
var t = $(this), a = t.data("params");
custom.confirm(n.confirm_message, "", function() {
return custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
}), $(".js_mass_action").click(function(e) {
e.preventDefault();
var t = $(this), a = t.data("params");
a || (a = {}), a.dripFeeds = [], $(".mass_item:checkbox:checked").each(function() {
a.dripFeeds.push($(this).val());
}), custom.confirm(n.confirm_message, "", function() {
return custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
}), $(".dropdown-load").on("show.bs.dropdown", function(e) {
var n = $(".dropdown-menu", this);
n.data("loaded") || custom.ajax({
url: $(this).data("load") + window.location.search,
type: "GET",
success: function(e, t, a) {
n.html(e).data("loaded", !0);
},
error: function(e, t, a) {
console.log("Something was wrong...", t, a, e), n.parents(".dropdown-load").removeClass("open");
}
});
});
}
}, customModule.appearanceEditLanguageController = {
run: function(n) {
$("#btn-reset-changes").click(function(e) {
var t = $(this), a = {};
a.code = t.data("language"), custom.confirm(n.confirm_message, "", function() {
custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
window.location = location.href;
}
});
}), e.preventDefault();
}), $("#search").submit(function(e) {
e.preventDefault();
var t = $("#live-search").val(), a = $("label[id*='" + t + "']").attr("id");
return a || (a = $("input[value*='" + t + "']").data("name")), a && (location.href = "#" + a), 
!1;
}), $("#default-language").click(function(e) {
e.preventDefault();
var t = $(this), a = {};
a.code = t.data("language"), custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
window.location = location.href;
}
});
}), $("#live-search").jQueryClearButton();
}
}, customModule.settingsEditNotificationController = {
run: function(a) {
$("#btn-reset").click(function(e) {
var t = $(this);
return e.preventDefault(), custom.confirm(a.confirm_message_reset, "", function() {
custom.sendBtn(t, {
type: "POST",
callback: function(e) {
if (!e || !e.redirect_url) return location.reload(), !1;
window.location.href = e.redirect_url;
}
});
}), !1;
}), $("#btn-test").click(function(e) {
return e.preventDefault(), $("#notification-send-test").modal("show"), !1;
}), $("#testNotificationForm").submit(function(e) {
e.preventDefault();
var t = $(this), a = $("#test-submit");
return custom.sendFrom(a, t, {
data: t.serialize(),
callback: function() {
location.reload();
}
}), !1;
});
var n = $("#select-variables");
n.selectpicker({
style: "btn-default btn-xs-caret"
}), n.on("change.bs.select", function(e) {
e.preventDefault();
var t = $("#notificationform-body"), a = t.prop("selectionStart");
t.val(function() {
var e = $(this).val(), t = n.val();
return n.val(""), e.substring(0, a) + t + e.substring(a, e.length);
});
});
}
}, customModule.settingsIntegrationsController = {
run: function(a) {
var n = this, e = $("#editIntegrationForm"), o = a.default_code_label;
$(".activate-integration").on("click", function(e) {
e.preventDefault();
var t = $(this);
n.prepareModal(t, !0, a.locations, o);
}), $(".edit-integration").on("click", function(e) {
e.preventDefault();
var t = $(this);
n.prepareModal(t, !1, a.locations, o);
}), $(".deactivate-integration-btn").on("click", function(e) {
e.preventDefault();
var t = $(this);
n.deactivate(t, a.deactivate_confirm_message);
}), e.on("submit", function(e) {
var t = $(this), a = t.find(":submit");
e.preventDefault(), custom.sendFrom(a, t, {
data: new FormData(this),
processData: !1,
contentType: !1,
success: function(e) {
"success" !== e.status ? $("#editIntegrationError").html(e.message).removeClass("hidden") : location.reload();
}
});
});
},
prepareModal: function(e, t, a, n) {
var o = $("#editIntegrationModal"), i = e.data("params");
$(".edit-integration-modal-title").text(i.name), $("#editIntegrationForm").attr("action", e.data("action")), 
$("#editintegrationform-visibility").val(i.visibility), $("#editIntegrationError").addClass("hidden"), 
this.prepareIntegration(i, a, n), t ? $(".deactivate-integration-btn").attr("href", "#").addClass("hidden") : $(".deactivate-integration-btn").attr("href", e.data("deactivate")).removeClass("hidden"), 
$(".files-list", o).empty(), 0 < i.files.length && $(".files-list", o).append(templates["admin/integration_files"]({
files: i.files
})), o.modal("show"), this.renderOptions(o, Object.values(i.settings));
},
renderOptions: function(e, t) {
if (e.find("#editIntegrationSettings").html(""), "undefined" !== t && t.length) {
var a = "";
$.each(t, function(e, t) {
"function" == typeof templates["admin/integration_settings_" + t.type] && (a += templates["admin/integration_settings_" + t.type]({
data: t
}));
}), $("#editIntegrationSettings", e).html(a);
}
},
prepareIntegration: function(n, o, i) {
var r = $("#editIntegrationCodes");
r.html(""), Object.keys(o).forEach(function(e) {
if (!(n.location.indexOf(e) < 0)) {
var t = "", a = "";
t = 1 === n.location.length ? i : o[e], e in n.code && (a = n.code[e]), r.append(templates["admin/integration_snippet"]({
label: t,
name: e,
value: a
}));
}
}), Object.keys(n.twigs).forEach(function(e) {
var t = "";
e in n.code && (t = n.code[e]), r.append(templates["admin/integration_snippet"]({
label: n.twigs[e].label,
name: e,
value: t
}));
});
},
deactivate: function(e, t) {
custom.confirm(t, "", function() {
return custom.sendBtn(e, {
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
},
submit: function(e) {
var t = $(e), a = t.find(":submit");
custom.sendFrom(a, t, {
data: new FormData(e),
success: function(e) {
"success" !== e.status ? $("#editIntegrationError").html(e.message).removeClass("hidden") : location.reload();
}
});
}
}, customModule.appearanceLanguageController = {
run: function(e) {
$("#editLanguage").submit(function(e) {
e.preventDefault();
var t = $(this), a = $("#edit-language-btn");
custom.sendFrom(a, t, {
data: t.serialize(),
callback: function() {
window.location = location.href;
}
});
});
}
}, customModule.appearanceLanguagesVisualController = {
run: function(a) {
$("#addLanguage").submit(function(e) {
e.preventDefault();
var t = $(this), a = $("#addlanguage_submit_button");
custom.sendFrom(a, t, {
data: t.serialize(),
callback: function(e) {
window.location = location.href;
}
});
}), $(".js_action").click(function(e) {
e.preventDefault();
var t = $(this);
custom.confirm(a.confirm_message, "", function() {
return custom.sendBtn(t, {
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
}), $(".js_confirm_submit").click(function(e) {
e.preventDefault();
var t = $(this).closest("form");
custom.confirm(a.confirm_message, "", function() {
return t.find("#set_default").val(1), t.submit(), !1;
});
}), $("#search").submit(function(e) {
e.preventDefault();
var t = $("#live-search").val(), a = $("label[id*='" + t + "']").attr("id");
return a || (a = $("input[value*='" + t + "']").data("name")), a && (location.href = "#" + a), 
!1;
});
}
}, customModule.appearanceLanguagesController = {
run: function(e) {
$(".selectpicker").selectpicker({
style: "btn-default",
size: "auto"
}), $("#sortable").sortable({
handle: ".table__drag",
placeholder: "table__drag-placeholder",
start: function(e, t) {
$(this).attr("data-previndex", t.item.index());
},
update: function(e, t) {
var a = parseInt(t.item.index()), n = parseInt($(this).attr("data-previndex"));
n !== a && function(e, t) {
var a = {
oldIndex: e + 1,
newIndex: t + 1
};
custom.ajax({
url: "/admin/appearance/language-edit-position",
data: a,
type: "POST",
success: function(e) {
"success" != e.status && custom.notify({
0: {
type: "danger",
text: e.message
}
});
}
});
}(n, a), $(this).removeAttr("data-previndex");
}
}), $("#addLanguage").submit(function(e) {
e.preventDefault();
var t = $(this), a = $("#addpayment_submit_button");
custom.sendFrom(a, t, {
data: t.serialize(),
callback: function(e) {
window.location = location.href;
}
});
}), $(document).on("change", "input[name=active]", function(e) {
$(this).data("code");
var t = $(this).prop("checked") ? 1 : 0;
!function(e, t, a) {
var n = {
code: e,
visibility: t
};
custom.ajax({
url: "/admin/appearance/language-edit-visibility",
data: n,
type: "POST",
success: function(e) {
"success" != e.status ? (console.log(e.status), custom.notify({
0: {
type: "danger",
text: e.message
}
})) : a.toggleClass("grey");
}
});
}($(this).data("code"), t, $(this).closest(".ui-state-default"));
});
}
}, customModule.appearanceMenuController = {
run: function(o) {
var r = $("#icon-picker-input"), l = $("#icon-picker-btn");
function s(e, t, a) {
for (e.find("option:not([disabled])").remove(), a && e.append('<option selected value="' + a.id + '" >' + a.name + "</option>"), 
i = 0; i < t.length; i++) e.append('<option value="' + t[i].id + '" >' + t[i].name + "</option>"), 
"external" === t[i].id && $("#external-page-url").val(t[i].url);
1 < e.find("option").length && !a && $(".default-menu-name").val(t[0].name), "external" === e.val() ? ($(".external-url-label").removeClass("hidden"), 
$("#external-page-url").removeClass("hidden")) : ($(".external-url-label").addClass("hidden"), 
$("#external-page-url").addClass("hidden"));
}
function d(o) {
$("input.translations").each(function(e, t) {
var a = $(t), n = a.data("lang");
o ? a.val(o[n]) : a.val("");
});
}
$("#edit_menu_item").on("shown.bs.modal", function(e) {
$(document).off("focusin.modal");
}), l.on("change", function(e) {
var t = $(this).data("input-icon");
t && $(t).val("empty" !== e.icon ? e.icon : "");
}), $(".add-modal-menu").click(function(e) {
var t = $(this), a = parseInt($(t).data("public"));
!function(e, t) {
var a = {
public: e
};
custom.ajax({
url: "/admin/appearance/menu-pages",
data: a,
type: "Get",
success: function(e) {
"success" != e.status ? custom.notify({
0: {
type: "danger",
text: e.message
}
}) : s(t, e.data);
}
});
}(a, $("#select-pages")), $("#menu-delete-div").hide(), $("#myModalLabel").text(o.add_modal_header), 
$("#addmenu_submit_button").text(o.add_modal_header), $("#editmenuform-public").val(a), 
$("#editMenuForm").attr("action", "/admin/appearance/create-menu"), r.val(""), l.iconpicker("setIcon", "empty"), 
d(null), $("#menu-id").prop("disabled", !0), $("#editMenuError").addClass("hidden"), 
$("#edit_menu_item").modal("show");
}), $(".edit-modal-menu").click(function(e) {
var t = $(this), a = parseInt($(t).data("public"));
$("#myModalLabel").text(o.edit_modal_header), $("#editmenuform-public").val(a), 
$("#addmenu_submit_button").text(o.edit_modal_header), $("#editMenuForm").attr("action", "/admin/appearance/edit-menu"), 
r.val(""), l.iconpicker("setIcon", "empty"), function(t) {
var e = {
id: t
};
custom.ajax({
url: "/admin/appearance/get-menu",
data: e,
type: "Get",
success: function(e) {
"success" != e.status ? custom.notify({
0: {
type: "danger",
text: e.message
}
}) : (s($("#select-pages"), e.data.pages, e.data.currentPage), d(e.data.translations), 
$("#menu-delete-div").show(), $("#menu-delete-div").data("id", t), e.data.icon && (r.val(e.data.icon), 
l.iconpicker("setIcon", e.data.icon)));
}
});
}(t.data("id"));
var n = $("#menu-id");
n.prop("disabled", !1), n.val(t.data("id")), $("#editMenuError").addClass("hidden"), 
$("#edit_menu_item").modal("show");
}), $("#editMenuForm").submit(function(e) {
e.preventDefault();
var t = $(this), a = $("#addmenu_submit_button");
return custom.sendFrom(a, t, {
data: t.serialize(),
callback: function() {
location.reload();
}
}), !1;
}), $(document).on("click", "#delete-menu", function(e) {
var t = {
id: $("#menu-delete-div").data("id")
};
custom.ajax({
url: "/admin/appearance/delete-menu",
data: t,
type: "Post",
success: function(e) {
"success" != e.status ? custom.notify({
0: {
type: "danger",
text: e.message
}
}) : location.reload();
}
});
}), $("#public_menu, #signed_menu").sortable({
placeholder: "dd-placeholder",
start: function(e, t) {
$(this).attr("data-previndex", t.item.index());
},
update: function(e, t) {},
stop: function(e, t) {
var a = $.map($(this).find("li"), function(e) {
return {
position: $(e).index(),
id: $(e).attr("data-id")
};
}), n = "public_menu" === $(e.target).closest(".dd-list").attr("id"), o = parseInt(t.item.index());
!function(e, t, a, n) {
var o = {
tree: e,
oldIndex: a,
newIndex: n,
public: t ? 1 : 0
};
custom.ajax({
url: "/admin/appearance/position-menu",
data: o,
type: "POST",
success: function(e) {
"success" != e.status && custom.notify({
0: {
type: "danger",
text: e.message
}
});
}
});
}(a, n, parseInt($(this).attr("data-previndex")) + 1, o + 1), $(this).removeAttr("data-previndex");
}
}), $("#select-pages").change(function(e) {
$(this).val() ? $(".default-menu-name").val($(this).find(":selected").text()) : $(".default-menu-name").val(""), 
"external" === $(this).val() ? ($(".external-url-label").removeClass("hidden"), 
$("#external-page-url").removeClass("hidden")) : ($(".external-url-label").addClass("hidden"), 
$("#external-page-url").addClass("hidden"));
});
}
}, customModule.settingsModulesController = {
run: function(o) {
var i = this, r = $("#editModuleForm");
$(".edit-module").click(function(e) {
e.stopPropagation();
var t = $(this), a = t.data("form"), n = t.data("module");
$(".deactivate-module-btn").removeClass("hidden"), i.composeForm(a, n, !0), i.prepareModal(t);
}), $(".deactivate-module").click(function(e) {
e.stopPropagation(), e.preventDefault();
var t = $(this), a = t.data("form"), n = t.data("module");
i.composeForm(a, n, !0), t.attr("href", $(".deactivate-module-btn").attr("href")), 
i.deactivate(t, o);
}), $(".activate-module").click(function(e) {
var t = $(this), a = t.data("form"), n = t.data("module");
e.stopPropagation(), i.composeForm(a, n, !1), 0 === a.length ? ($("#editModuleForm").attr("action", t.data("action")), 
i.submit(r, $("#moduleSubmitBtn"))) : ($(".deactivate-module-btn").addClass("hidden"), 
i.prepareModal(t));
}), $(document).on("click", "#moduleSubmitBtn", function(e) {
e.preventDefault(), i.submit(r, $(this));
}), $(".deactivate-module-btn").click(function(e) {
e.preventDefault();
var t = $(this);
i.deactivate(t, o);
});
},
prepareModal: function(e) {
$(".edit-module-modal-title").text(e.data("title")), $("#editModuleForm").attr("action", e.data("action")), 
$("#editModuleError").addClass("hidden"), $("#editModuleModal").modal("show");
},
composeForm: function(e, t, a) {
var n = $(".edit-module-modal-body"), o = $(".deactivate-module-btn"), i = o.attr("href").replace(/\?id=[0-9]+/g, "");
for (key in n.html(""), o.attr("href", i + "?id=" + t), e) {
var r = e[key], l = a ? r.value : r.default_value;
"input" === r.type && n.append(templates["admin/modules_modal_input"]({
label: r.label,
name: r.project_column,
value: Number(l)
})), "select" === r.type && n.append(templates["admin/modules_modal_select"]({
label: r.label,
name: r.project_column,
selectItems: r.select_items,
value: l
}));
}
},
deactivate: function(e, t) {
custom.confirm(t.deactivate_confirm_message, "", function() {
return custom.sendBtn(e, {
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
},
submit: function(e, t) {
custom.sendFrom(t, e, {
data: e.serialize(),
success: function(e) {
"success" !== e.status ? ($("#editModuleError").html(e.message), $("#editModuleError").removeClass("hidden")) : location.reload();
}
});
}
}, customModule.settingsNotificationsController = {
run: function(o) {
$("#addEmailModal").click(function(e) {
$(".settings-emails__list-body").children().each(function() {
var e = $(this).find("input[type=checkbox]");
e.prop("checked", !0), $(this).removeClass("settings-emails__notification-disabled");
}), $("#staff-delete-div").hide(), $(".modal-title").text(o.add_modal_header), $("#editStaffEmailForm").attr("action", "/admin/settings/create-staff-email"), 
$("#editStaffError").addClass("hidden"), $("#staff-id").prop("disabled", !0), $("#staffemailform-email").val(""), 
$("#add-email-modal").modal("show");
}), $(".editEmailModal").click(function(e) {
var t = $(this);
$("modal-title").text(o.edit_modal_header), $("#editStaffEmailForm").attr("action", "/admin/settings/edit-staff-email");
var a = $("#staff-id"), n = $("#staff-delete-div");
n.data("id", t.data("id")), n.show(), a.prop("disabled", !1), a.val(t.data("id")), 
function(e) {
var t = {
id: e
};
custom.ajax({
url: "/admin/settings/get-notifications",
data: t,
type: "Get",
async: !1,
success: function(e) {
"success" != e.status ? custom.notify({
0: {
type: "danger",
text: e.message
}
}) : function(a) {
$(".settings-emails__list-body").children().each(function() {
var e = $(this).find("input[type=checkbox]"), t = e.data("name");
-1 !== a.indexOf(t.toString()) ? (e.prop("checked", !0), $(this).removeClass("settings-emails__notification-disabled")) : (e.prop("checked", !1), 
$(this).addClass("settings-emails__notification-disabled"));
});
}(e.data);
}
});
}(t.data("id")), $("#staffemailform-email").val(t.data("email")), $("#editStaffError").addClass("hidden"), 
$("#add-email-modal").modal("show");
}), $("#editStaffEmailForm").submit(function(e) {
e.preventDefault();
var t = $(this), a = $("#staff_submit_button");
return custom.sendFrom(a, t, {
data: t.serialize(),
callback: function() {
location.reload();
}
}), !1;
}), $(".switch-input").change(function() {
$(this).closest(".settings-emails__list-row").toggleClass("settings-emails__notification-disabled");
}), $(document).on("click", "#delete-staff", function(e) {
var t = {
id: $("#staff-delete-div").data("id")
};
custom.ajax({
url: "/admin/settings/delete-staff-email",
data: t,
type: "Post",
success: function(e) {
"success" != e.status ? custom.notify({
0: {
type: "danger",
text: e.message
}
}) : location.reload();
}
});
});
}
}, customModule.ordersControllerExport = {
run: function(e) {
var t = e.exportFromDate || moment().subtract(1, "months").format("YYYY-MM-DD"), a = e.exportToDate || new Date(), n = e.limitDays || null;
$(function() {
$('[data-toggle="tooltip"]').tooltip();
}), $(".selectpicker").selectpicker({
style: "btn-default",
size: "auto"
}), $("#from_to_date").daterangepicker({
locale: {
format: "YYYY-MM-DD"
},
maxSpan: {
days: n
},
autoUpdateInput: !0,
startDate: t,
maxDate: a
}, function(e, t, a) {
var n = e.format("YYYY-MM-DD"), o = t.format("YYYY-MM-DD");
$("#from_date").val(n), $("#to_date").val(o);
});
var o = "", i = {
ajax: {
url: "/admin/users/get-users",
type: "POST",
dataType: "json",
data: {
q: "{{{q}}}"
}
},
preserveSelected: !0,
minLength: 2,
locale: {
emptyTitle: "All users"
},
cache: !1,
preprocessData: function(e) {
var t, a = e.length, n = [];
if (a) for (t = 0; t < a; t++) n.push($.extend(!0, e[t], {
text: e[t].login,
value: e[t].id
}));
return n;
}
}, r = $("#ajax-select-multiple");
r.selectpicker().filter(".with-ajax").ajaxSelectPicker(i), r.trigger("change").data("AjaxBootstrapSelect").list.cache = {}, 
$(document).on("input", ".with-ajax .bs-searchbox input", function() {
o = $(this).val();
}), $(".selectpicker").on("shown.bs.select", function(e) {
$(".with-ajax .bs-searchbox input").val(o);
});
}
}, customModule.ordersControllerMassCancel = {
run: function(e) {
var a = e.error_max_limit, n = e.max_limit, o = $(".error-summary");
$("#links").keyup(function(e) {
var t = $(this).val().split("\n").length;
if (n < t) {
if (o.hasClass("hidden")) return o.removeClass("hidden").html(a), $("button:submit").attr("disabled", !0), 
!1;
} else o.hasClass("hidden") || (o.addClass("hidden").html(""), $("button:submit").attr("disabled", !1));
});
}
}, customModule.ordersController = {
delayedRun: !1,
run: function(o) {
var t = customModule.deferredLoadController;
this.delayedRun || "object" != typeof window.modules || void 0 === window.modules.deferredLoadController ? ($(".dropdown-load button").on("click", function(e) {
t.processing && e.stopPropagation();
}), $(".dropdown-load").on("hide.bs.dropdown", function(e) {
t.processing && t.stop();
}).on("show.bs.dropdown", function(e) {
var n = $(".dropdown-menu", this);
n.data("loaded") || t.processing || custom.ajax({
url: $(this).data("load"),
type: "GET",
success: function(e) {
"success" === e.status ? (n.html(e.data), n.data("loaded", !0)) : e.hasOwnProperty("jsParams") && t.run(e.jsParams);
},
error: function(e, t, a) {
n.parents(".dropdown-load").removeClass("open"), "abort" !== t && (console.log("Something was wrong...", t, a, e), 
custom.notify({
0: {
type: "danger",
text: a
}
}));
}
});
}), $(".js-show-details").on("click", function(e) {
e.preventDefault(), $("#myModalLabelOrderDetail").html($(this).data("title")), $("#orderDetailContent .modal-body-data").html(""), 
$("#orderDetailContent .modal-loader-wrap").show(), $("#orderDetail").modal("show"), 
custom.ajax({
url: $(this).data("load"),
type: "GET",
dataType: "json",
success: function(e) {
$("#orderDetailError").addClass("hidden"), $("#orderDetailContent .modal-body-data").html(custom.buildFields("orderDetailItem", e)), 
$("#orderDetailContent .modal-loader-wrap").hide();
},
error: function(e, t, a) {
"abort" !== t && (console.log("Something was wrong...", t, a, e), $("#orderDetailError").removeClass("hidden").text(o.loading_details_error), 
$("#orderDetailContent .modal-loader-wrap").hide());
}
});
}), $(".js-show-info-data").on("click", function(e) {
e.preventDefault(), $("#myModalLabelOrderInfo").html($(this).text()), $("#orderInfoContent .modal-body-data").html(""), 
$("#orderInfoContent .modal-loader-wrap").show(), $(this).data("resend") ? ($("#orderInfoForm").attr("action", $(this).data("href")).show(), 
$("#orderInfoClose").hide()) : ($("#orderInfoForm").hide(), $("#orderInfoClose").show()), 
$("#checkSendError").modal("show"), custom.ajax({
url: $(this).data("load"),
type: "GET",
dataType: "json",
success: function(e) {
$("#sendInfoError").addClass("hidden"), $("#orderInfoContent .modal-body-data").html(custom.buildFields("orderInfoItem", e)), 
$("#orderInfoContent .modal-loader-wrap").hide();
},
error: function(e, t, a) {
"abort" !== t && (console.log("Something was wrong...", t, a, e), $("#sendInfoError").removeClass("hidden").text(o.loading_details_error), 
$("#orderInfoContent .modal-loader-wrap").hide());
}
});
}), $(".bulkorder-action").on("click", function(e) {
e.preventDefault(), $("#bulkStatus").val($(this).data("status")), custom.confirm(o.confirm_message, "", function() {
return $("#changebulkForm").submit(), !1;
}, {
confirm_button: o.confirm_button,
cancel_button: o.cancel_button
});
}), $(".confirm-change").on("click", function(e) {
e.preventDefault();
var t = $(this).data("href"), a = $(this).data("message") ? $(this).data("message") : o.confirm_message, n = $(this).data("text") ? $(this).data("text") : "";
custom.confirm(a, n, function() {
return window.location = t, !1;
}, {
confirm_button: o.confirm_button,
cancel_button: o.cancel_button
});
}), $("#editLink").on("show.bs.modal", function(e) {
$("#form_edit_link").attr("action", $(e.relatedTarget).data("href")), $("#form_edit_link_inp").val($(e.relatedTarget).data("link"));
}), $("#setStart").on("show.bs.modal", function(e) {
$("#start_id").val($(e.relatedTarget).data("id")), $("#inputStartCount").val("").trigger("change");
}), $("#setRemains").on("show.bs.modal", function(e) {
var t = $(e.relatedTarget);
$("#remains_id").val(t.data("id")), $("#inputRemainsCount").val("").attr("max", t.data("max")).trigger("change");
}), $("#setPartial").on("show.bs.modal", function(e) {
$("#partial_id").val($(e.relatedTarget).data("id")), $("#inputRemains").val("").trigger("change");
}), $("#inputStartCount, #inputRemainsCount, #inputRemains").on("keyup change", function(e) {
var t = $(this).parents(".modal-body").find(".error-summary");
"" === $(this).val() || custom.isInt($(this).val(), e) ? ($(this).removeClass("has-error"), 
t.addClass("hidden").text("")) : ($(this).addClass("has-error"), t.removeClass("hidden").text($(this).data("number-error")));
}), $("#setRemains form, #setPartial form").on("submit", function(e) {
var t = $(".has-error", this);
0 < t.length && (e.preventDefault(), t.first().focus());
}), $("#setStart form").on("submit", function(e) {
e.preventDefault();
var t = $(".has-error", this);
if (0 < t.length) t.first().focus(); else {
var a = $("#setStart"), n = $(this), o = n.find(":submit");
custom.sendFrom(o, n, {
data: $(this).serialize(),
callback: function(e) {
var t = $("#start_id", n).val();
$(".order" + t + " .start-count").text(e.data.start), a.modal("hide");
}
});
}
})) : this.delayedRun = !0;
},
reRun: function() {
"object" == typeof window.modules && void 0 !== window.modules.ordersController && (window.initCheckAll(), 
this.delayedRun = !0, this.run(window.modules.ordersController));
}
}, customModule.paymentsControllerExport = {
run: function(e) {
e.exportFromDate || new Date();
var t = e.exportToDate || new Date();
$(function() {
$('[data-toggle="tooltip"]').tooltip();
}), $(".selectpicker").selectpicker({
style: "btn-default",
size: "auto"
}), $("#exportFrom").datetimepicker({
format: "YYYY-MM-DD",
maxDate: t
}), $("#exportTo").datetimepicker({
format: "YYYY-MM-DD",
maxDate: t
});
var a = "", n = {
ajax: {
url: "/admin/users/get-users",
type: "POST",
dataType: "json",
data: {
q: "{{{q}}}"
}
},
preserveSelected: !0,
minLength: 2,
locale: {
emptyTitle: "All users"
},
cache: !1,
preprocessData: function(e) {
var t, a = e.length, n = [];
if (a) for (t = 0; t < a; t++) n.push($.extend(!0, e[t], {
text: e[t].login,
value: e[t].id
}));
return n;
}
}, o = $("#ajax-select-multiple");
o.selectpicker().filter(".with-ajax").ajaxSelectPicker(n), o.trigger("change").data("AjaxBootstrapSelect").list.cache = {}, 
$(document).on("input", ".with-ajax .bs-searchbox input", function() {
a = $(this).val();
}), $(".selectpicker").on("shown.bs.select", function(e) {
$(".with-ajax .bs-searchbox input").val(a);
});
}
}, customModule.paymentsController = {
run: function(n) {
$("#addPayment").click(function() {
$("#addpaymentsform-username").val(""), $("#addpaymentsform-memo").val(""), $("#addpaymentsform-amount").val(""), 
$("#addpaymentsform-method").val("0"), $("#addPaymentsError").addClass("hidden");
}), $("#addpayment_submit").submit(function(e) {
e.preventDefault();
var t = $("#addpayment_submit_button"), a = $(this);
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function() {
$("#addPayment").modal("hide"), location.reload();
}
}), !1;
}), $("#editpayment_submit").submit(function(e) {
e.preventDefault();
var t = $("#editpayment_submit_button"), a = $(this);
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function(e) {
$("#editPayment").modal("hide"), location.reload();
}
}), !1;
}), $("#reportpayment_submit").submit(function(e) {
e.preventDefault();
var t = $("#reportpayment_submit_button"), a = $(this);
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function(e) {
$("#reportPayment").modal("hide"), location.reload();
}
}), !1;
}), $(".payment-edit").click(function(e) {
e.preventDefault();
var t = $(this).data("payment");
$("#editpaymentsform-memo").val(t.memo), $("#payment-edit-id").val(t.id);
var a = $("#editpaymentsform-method");
a.val(t.method), null === a.val() && a.val(0), $("#editPayment").modal("show");
}), $(".js_report").click(function(e) {
$("#reportpaymentform-comment").val(""), $("#reportPaymentsError").addClass("hidden"), 
e.preventDefault();
var t = $(this).data("payment");
$("#payment-report-id").val(t.id), $("#reportPayment").modal("show");
}), $(".complete-payment").click(function(e) {
e.preventDefault();
var t = $(this).data("payment"), a = $("#completePaymentModal");
$("#completePaymentForm").attr("action", $(this).attr("href")), $("#complete-payment-id", a).val(t.id), 
$("#complete-payment-type", a).val(t.type), $("#editpaymentsform-memo", a).val(""), 
a.modal("show");
}), $(".accept-payment").click(function(e) {
var t = $(this), a = t.data("params");
custom.confirm(n.confirm_message, "", function() {
return custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
location.reload();
}
}), !1;
}), e.preventDefault();
}), $(document).on("click", "#completePaymentBtn", function(e) {
e.preventDefault();
var t = $(this), a = $("#completePaymentForm");
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function(e) {
$("#completePaymentModal").modal("hide"), location.reload();
}
}), !1;
}), $(".payments-details").click(function(e) {
e.preventDefault();
var t = $(this), a = $("#checkResponse");
$(".hide-when-loaded", a).css("display", "none"), a.modal("show"), custom.sendBtn(t, {
data: {
id: t.data("id")
},
type: "GET",
spinnerLocation: $(".modal-title", a),
callback: function(e) {
$(".hide-when-loaded", a).css("display", "block"), $(".field_detils", a).html(e.data.response), 
e.data.ip && $(".field_ip", a).val(e.data.ip);
}
});
}), $("#addpaymentsform-username").change(function(e) {
var n = $("#addpayment_submit_button");
n.prop("disabled", "disabled"), custom.ajax({
url: "/admin/payments/find-user?username=" + $(this).val(),
type: "GET",
success: function(e) {
var t = $("#addpaymentsform-includereferralpayment"), a = $("#addPaymentsError");
"success" == e.status && e.referrer ? (t.prop("disabled", ""), t.closest(".form-group").show()) : (t.prop("disabled", "disabled"), 
t.closest(".form-group").hide()), "error" == e.status ? (a.html(e.message), a.removeClass("hidden")) : (a.addClass("hidden"), 
n.prop("disabled", ""));
}
});
}), $(".dropdown-load").on("show.bs.dropdown", function(e) {
var n = $(".dropdown-menu", this);
n.data("loaded") || custom.ajax({
url: $(this).data("load") + window.location.search,
type: "GET",
success: function(e, t, a) {
n.html(e).data("loaded", !0);
},
error: function(e, t, a) {
console.log("Something was wrong...", t, a, e), n.parents(".dropdown-load").removeClass("open");
}
});
});
}
}, customModule.reportsController = {
run: function(e) {
if (e.months && $("#datetimepicker-tickets").datetimepicker({
viewMode: "months",
maxDate: new Date(),
format: "MM/YYYY"
}), e.users) {
var t = "", a = {
ajax: {
url: "/admin/api/users/get-users-info",
type: "POST",
dataType: "json",
data: {
query: "{{{q}}}"
}
},
preserveSelected: !0,
minLength: 2,
locale: {
emptyTitle: "All users"
},
cache: !1,
preprocessData: function(e) {
if (!e.success) return [];
var t, a = e.data, n = a.length, o = [];
if (n) for (t = 0; t < n; t++) o.push($.extend(!0, a[t], {
text: a[t].login,
value: a[t].id
}));
return o;
}
}, n = $("#ajax-select-multiple");
n.length && (n.selectpicker().filter(".with-ajax").ajaxSelectPicker(a), n.trigger("change").data("AjaxBootstrapSelect").list.cache = {}, 
$(document).on("input", ".with-ajax .bs-searchbox input", function() {
t = $(this).val();
}), n.on("shown.bs.select", function(e) {
$(".with-ajax .bs-searchbox input").val(t);
}));
}
e.enabledServices && this.enableServices(e.enabledServices);
},
enableServices: function(e) {
var a = $(".selectpicker_service select");
void 0 !== e && ($("option", a).attr("disabled", !0), $.each(e, function(e, t) {
$('option[value="' + t + '"]', a).removeAttr("disabled");
}), $("option[disabled]", a).removeAttr("selected")), a.removeAttr("disabled").selectpicker("refresh"), 
a.parents("form").on("submit", function(e) {
$("option:selected", a).length === $("option:enabled", a).length && $("option", a).attr("selected", !1);
});
}
}, customModule.settingsBonusesController = {
run: function(e) {
var i, r, l, s, d = e.modal_titles, c = e.submit_titles;
$('[data-toggle="tooltip"]').tooltip(), window, i = $("#editBonusModal"), r = i.find("form"), 
l = i.find(":submit"), s = custom.freezeForm(r), r.submit(function(e) {
e.preventDefault(), custom.sendFrom(l, r, {
data: $(this).serialize(),
callback: function(e) {
i.modal("hide"), location.reload();
}
});
}), i.on("show.bs.modal", function(e) {
var t = $(e.relatedTarget), a = t.data("action_url"), n = t.data("get_url"), o = n ? 1 : 0;
custom.restoreForm(s, r), r.attr("action", a), r.find(".error-summary").addClass("hidden"), 
i.find(".modal-title").html(d[o]), l.html(c[o]), o && (custom.showModalLoader(!0), 
custom.ajax({
url: n,
type: "GET",
success: function(e, t, a) {
if (!e.data || !_.isObject(e.data)) return i.modal("hide"), void console.log("Undefined data...", t, a);
!function(e) {
r.find("#editbonusform-amount").val(e.amount), r.find("#editbonusform-method").val(e.method), 
r.find("#editbonusform-deposit_from").val(e.deposit_from), r.find("#editbonusform-status").val(e.status);
}(e.data), custom.showModalLoader(!1);
},
error: function(e, t, a) {
custom.showModalLoader(!1), i.modal("hide"), console.log("Something was wrong...", t, a, e);
}
}));
});
}
}, customModule.settingsGeneralController = {
run: function(e) {
$("input:file").on("change", function() {
var t = $(this).attr("data-target");
if (this.files && this.files[0]) {
var e = new FileReader();
e.onload = function(e) {
$(t).attr("src", e.target.result);
}, $(t).parent().find(".setting-block__image-remove").addClass("hidden"), $(t).closest(".image_container").removeClass("hidden"), 
e.readAsDataURL(this.files[0]);
}
}), $("#editgeneralform-affiliate_system").change(function() {
$("#affiliate").toggleClass("hidden");
}), $("#editgeneralform-child_panels_selling").change(function() {
$("#child_panels").toggleClass("hidden");
}), $("#editgeneralform-ticket_system").change(function() {
$("#ticket_per_user").toggleClass("hidden");
}), $("#editgeneralform-registration_page").change(function() {
$("#free_balance").toggleClass("hidden");
}), $("#editgeneralform-free_balance").change(function() {
$("#free_balance_amount").toggleClass("hidden");
}), window, $(".delete_image_action").click(function(e) {
var t = $(this).attr("href"), n = $(this).closest(".image_container").find(".modal-loader"), a = $(this).closest(".setting-block__image-remove");
e.preventDefault(), n.removeClass("hidden"), a.addClass("hidden"), custom.ajax({
url: t,
type: "POST",
success: function(e, t, a) {
n.addClass("hidden"), location.reload();
},
error: function(e, t, a) {
n.addClass("hidden"), location.reload();
}
});
}), $("#falling-snow-status").change(function(e) {
if (parseInt(e.target.value, 10)) $(".falling-snow").removeClass("falling-snow__disabled"), 
$(".falling-snow__settings").slideDown("fast"); else {
$(".falling-snow").addClass("falling-snow__disabled"), $(".falling-snow__settings").slideUp("fast");
var t = $("form.falling-snow__form"), a = $("#save-snow-btn");
custom.sendFrom(a, t, {
data: t.serialize(),
callback: function() {
location.reload();
}
});
}
});
}
}, customModule.settingsPaymentsController = {
run: function(e) {
var c = this;
$("#addPaymentMethod").click(function(e) {
e.preventDefault();
var t = $(this).data("url"), a = $("#addPaymentMethodForm"), n = $("#addPaymentMethodModal"), o = $("#addPaymentMethodError", a);
return $("select", a).prop("selectedIndex", 0), a.attr("action", t), o.addClass("hidden"), 
o.html(""), n.modal("show"), !1;
}), $(document).on("click", "#addPaymentMethodBtn", function(e) {
e.preventDefault();
var t = $(this), a = $("#addPaymentMethodForm");
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function(e) {
$("#addPaymentMethodModal").modal("hide"), location.reload();
}
}), !1;
}), $("#show-data-btn").click(function(e) {
e.preventDefault();
var t = $(this), a = $("#editPaymentMethodModal"), n = t.data("action"), o = a.data("id");
return custom.ajax({
url: n + "?id=" + o,
data: {},
dataType: "json",
success: function(e) {
if ("success" === e.status) {
var t = e.data;
for (var a in t) if (t.hasOwnProperty(a)) {
var n = $("#edit-payment-method-options-" + a);
console.log(t[a]), n.is("textarea") ? n.summernote("code", t[a]) : n.val(t[a]);
}
$(".edit-payments .show-data").hide();
}
}
}), !1;
}), $(".edit-payment-method").click(function(e) {
e.preventDefault(), $(".edit-payments .show-data").show();
var t = $(this), a = t.data("url"), n = $("#editPaymentMethodForm"), o = $("#editPaymentMethodModal"), i = $("#editPaymentMethodError", n), r = t.data("details"), l = $("#editPaymentMethodDescription", o), s = $("#commission-block", o);
$("#editPaymentMethodAlert", n).remove(), "object" == typeof r.alert && r.alert && $(".modal-body", n).prepend('<div class="alert alert-' + r.alert.type + '" role="alert" id="editPaymentMethodAlert">' + r.alert.message + "</div>"), 
$("select", n).prop("selectedIndex", 0), n.attr("action", a), i.addClass("hidden"), 
i.html(""), $(".field-editpaymentmethodform-take_fee_from_user", n).hide(), s.hide(), 
s.html(""), l.addClass("hidden"), $(".description-content", l).html(""), o.data("id", r.id), 
$("#editPaymentMethodLabel", o).html(r.title + " (ID: " + r.id + ")"), $("#editpaymentmethodform-name", o).val(r.name), 
$("#editpaymentmethodform-minimal", o).val(r.minimal), $("#editpaymentmethodform-maximal", o).val(r.maximal), 
$("#editpaymentmethodform-new_users", o).val(r.new_users), $("#editpaymentmethodform-take_fee_from_user", o).val(r.take_fee_from_user), 
r.has_commission && (s.show(), s.html(c.renderCommissionBlock(r))), r.is_enabled_take_fee_from_user && $(".field-editpaymentmethodform-take_fee_from_user", n).show();
var d = $("#editpaymentmethodform-amount_currency");
return $("option", d).remove(), r.addfunds_amount_currencies && 0 < r.addfunds_amount_currencies.length ? ($.each(r.addfunds_amount_currencies, function(e, t) {
var a = $("<option/>", {
value: t
}).text(t);
t === r.amount_currency && a.attr("selected", !0), d.append(a);
}), $(".field-editpaymentmethodform-amount_currency", n).show()) : $(".field-editpaymentmethodform-amount_currency", n).hide(), 
"string" == typeof r.description && r.description.length && ($(".description-content", l).html(r.description), 
l.removeClass("hidden")), c.renderOptions(o, r.options, t), $("#edit-payment-method-options-gateway", o).data("changed", !1).trigger("change"), 
o.modal("show"), !1;
}), $(document).on("submit", "#editPaymentMethodForm", function(e) {
e.preventDefault();
var t = $(this), a = $("#editPaymentMethodForm");
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function(e) {
$("#editPaymentMethodModal").modal("hide"), location.reload();
}
}), !1;
}), $(document).on("click", ".add-multi-input", function(e) {
e.preventDefault();
var t = $(this), a = $(t.data("id"));
return a.length && a.append(c.renderMultiInput(t.data(), "")), !1;
}), $(document).on("click", ".add-amount", function(e) {
e.preventDefault();
var t = $(this), a = $(t.data("id"));
return a.length && a.append(c.renderAmountInput(t.data(), {
amount: "",
description: ""
})), !1;
}), $(document).on("change", ".toggle-payment-method", function(e) {
e.preventDefault();
var t = $(this);
return custom.ajax({
method: "POST",
url: t.data("action"),
success: function(e) {
if ("error" == e.status) return t.prop("checked", !t.prop("checked")), !1;
t.parents("tr").toggleClass("grey");
}
}), !1;
}), $(document).on("change", "#edit-payment-method-options-amount", function(e) {
e.preventDefault();
var t = $("#editPaymentMethodModal"), a = $(this);
return $("#amount_container_row, #editPaymentMethodMinMax", t).addClass("hidden"), 
$("#amount_container_row", t).find("input.amount-description").prop("required", !1), 
!0 === a.data("new_gates") || (1 == a.val() ? ($("#amount_container_row", t).removeClass("hidden"), 
$("#amount_container_row", t).find("input.amount-description").prop("required", !0), 
$("#multi_input_container_descriptions", t).addClass("hidden"), $("#multi_input_container_descriptions", t).find("input").prop("required", !1), 
$(".add-multi-input", t).addClass("hidden")) : ($("#editPaymentMethodMinMax", t).removeClass("hidden"), 
$("#multi_input_container_descriptions", t).removeClass("hidden"), $("#multi_input_container_descriptions", t).find("input").prop("required", !0), 
$(".add-multi-input", t).removeClass("hidden"))), !1;
}), $(document).on("change", "#edit-payment-method-options-gateway", function(e) {
e.preventDefault();
var t = $("#edit-payment-method-options-amount");
t.length || (t = $("<input/>", {
id: "edit-payment-method-options-amount",
type: "hidden"
}), $(this).append(t));
var a = t.parent(".form-group"), n = $(this), o = n.val(), i = o && "#1" === o.substr(-2, 2);
return a.toggleClass("hidden", i), t.data("new_gates", i), i ? t.val(1) : n.data("changed") && t.val(0), 
n.data("changed", !0), t.trigger("change"), !1;
}), $(document).on("click", ".remove__paypal-description", function(e) {
return e.preventDefault(), $(this).parents(".form-group__paypal-description").remove(), 
!1;
}), $(document).on("click", ".remove__generator-row", function(e) {
return e.preventDefault(), $(this).parents(".form-group__generator-row").remove(), 
!1;
}), $('[data-toggle="tooltip"]').tooltip(), $("#sortable").sortable({
handle: ".table__drag",
placeholder: "table__drag-placeholder",
start: function(e, t) {
$(this).attr("data-previndex", t.item.index());
},
update: function(e, t) {
var a = 1 * t.item.index(), n = 1 * $(this).attr("data-previndex"), o = $(".table__drag", t.item).data("action");
$(this).removeAttr("data-previndex"), $.post(o, {
position: 1 + a,
old_position: 1 + n
});
}
}), $("#addPaymentMethod, .edit-payment-method, .toggle-payment-method").removeAttr("disabled");
},
renderOptions: function(e, t) {
var n = this;
if ($("#options-container", e).html(""), "undefined" !== t && t.length) {
var o = "", i = "";
$.each(t, function(e, a) {
"function" == typeof templates["admin/payment_settings_" + a.type] && ("multi_input" == a.type ? (i = "", 
$.each(a.values, function(e, t) {
i += n.renderMultiInput(a, t);
}), o += templates["admin/payment_settings_" + a.type + "_container"]({
data: a,
content: i
})) : "amounts" == a.type ? (i = "", $.each(a.values, function(e, t) {
i += n.renderAmountInput(a, t, e);
}), o += templates["admin/payment_settings_" + a.type + "_container"]({
data: a,
content: i
})) : "meta_tag_editable" == a.type ? o += n.renderMetaTagEditable(a, e) : o += templates["admin/payment_settings_" + a.type]({
data: a
}));
}), $("#options-container", e).html(o), $("#editPaymentMethodOptions textarea", e).not(".raw-textarea").summernote({
dialogsInBody: !0,
minHeight: 200,
toolbar: [ [ "style", [ "style", "bold", "italic" ] ], [ "lists", [ "ul", "ol" ] ], [ "para", [ "paragraph" ] ], [ "color", [ "forecolor", "backcolor", "clear" ] ], [ "insert", [ "link", "picture", "video" ] ], [ "codeview", [ "codeview" ] ] ],
disableDragAndDrop: !0,
styleTags: [ "p", "h1", "h2", "h3", "h4", "h5", "h6" ],
popover: {
image: [ [ "custom", [ "imageAttributes" ] ], [ "imagesize", [ "imageSize100", "imageSize50", "imageSize25" ] ], [ "float", [ "floatLeft", "floatRight", "floatNone" ] ], [ "remove", [ "removeMedia" ] ] ]
},
dialogsFade: !0,
imageAttributes: {
icon: '<i class="note-icon-pencil"/>',
removeEmpty: !0,
disableUpload: !0
}
});
}
},
renderMultiInput: function(e, t, a) {
return templates["admin/payment_settings_multi_input"]({
data: e,
value: t,
index: a
});
},
renderAmountInput: function(e, t, a) {
return templates["admin/payment_settings_amounts"]({
data: e,
value: t,
index: a
});
},
renderCommissionBlock: function(e, t) {
return templates["admin/payment_settings_commission_block"]({
data: e,
value: t
});
},
renderMetaTagEditable: function(o, e) {
var t = "#edit-payment-method-options-" + o.code + "-button";
return $(document).off("click", t).on("click", t, function(e) {
var t = $("#editPaymentMethodForm"), a = $(this), n = $("#edit-payment-method-options-" + o.code);
n.prop("disabled") ? n.prop("disabled", !1) : custom.sendFrom(a, t, {
data: t.serialize(),
callback: function(e) {
n.prop("disabled", !0), a.html(o.button_edit_title);
}
});
}), templates["admin/payment_settings_" + o.type]({
data: o
});
}
}, customModule.settingsProvidersController = {
run: function(e) {
var t, a, n, m = e.form_fields, s = e.balance_url, d = e.balance_info, c = e.balance_request_timeout, u = e.balance_timeout;
$('[data-toggle="tooltip"]').tooltip(), window, t = $("#addProviderModal"), a = t.find("form"), 
n = t.find(":submit"), a.submit(function(e) {
e.preventDefault(), custom.sendFrom(n, a, {
data: $(this).serialize(),
callback: function(e) {
t.modal("hide"), location.reload();
}
});
}), t.on("show.bs.modal", function(e) {
a.find(":text").val(""), a.find(".error-summary").addClass("hidden");
}), function(e) {
var i, r, l, s = $("#editProviderModal"), d = s.find("form"), t = s.find(":submit"), n = (s.find(".delete_provider"), 
s.find(".error-summary"));
function c() {
n.addClass("hidden"), n.html("");
}
d.submit(function(e) {
e.preventDefault(), custom.sendFrom(t, d, {
data: $(this).serialize(),
callback: function(e) {
s.modal("hide"), location.reload();
}
});
}), $(document).on("click", ".delete_provider_submit", function() {
_.defer(_.bind(function() {
custom.showModalLoader(!0), c(), custom.ajax({
url: l,
type: "POST",
data: {
id: ""
},
success: function(e, t, a) {
custom.showModalLoader(!1), "success" === e.status ? (s.modal("hide"), location.reload()) : "error" === e.status && (n.html(e.message), 
n.removeClass("hidden"));
},
error: function() {
custom.showModalLoader(!1), s.modal("hide"), console.log("Something was wrong...", textStatus, errorThrown, jqXHR);
}
});
}), this);
}), s.on("show.bs.modal", function(e) {
var t = $(e.relatedTarget), a = t.data("action_url"), n = t.data("get_url"), o = t.closest("tr").attr("id");
r = t.data("authkeys_field"), l = t.data("delete_url"), d.attr("action", a), s.find("#provider_field").val(o), 
d.find(".form_field").hide(), d.find(".form_field :text").val(""), c(), custom.showModalLoader(!0), 
custom.ajax({
url: n,
type: "GET",
success: function(e, t, a) {
if (!e.data || !_.isObject(e.data)) return s.modal("hide"), void console.log("Undefined data...", t, a);
!function(n) {
_.isNumber(r) || (r = 0), i = m[r] || m[0], _.each(i, function(e, t) {
var a = d.find(".form-group." + t);
a.show().find("label").html(e), a.find(":text").val(n[t]);
});
}(e.data), custom.showModalLoader(!1);
},
error: function(e, t, a) {
custom.showModalLoader(!1), s.modal("hide"), console.log("Something was wrong...", t, a, e);
}
});
});
}(window), function(e) {
var t = $("#live-search"), a = $(".providers_list .list_item");
function n(e) {
var t = e.match(/^http.?:\/\/[^/]+/i);
if (!t) return null;
var a = document.createElement("a");
return a.href = t[0], a.hostname;
}
t.jQueryClearButton(), t.on("input", function(e) {
var t = $(this).val().trim();
n(t) && (t = n(t)), a.each(function() {
$(this).find(".name").text().search(new RegExp(t, "i")) < 0 ? $(this).hide() : $(this).show();
});
}), t.keyup(function(e) {
27 === e.which && (t.val(""), t.trigger("input")), 13 === e.which && e.preventDefault();
}), $(".live_search_container").on("click", ".clear-button-live-search", function(e) {
_.defer(function() {
t.trigger("input");
});
});
var o = function() {
var a = [];
$(".providers_list tr.unload").each(function(e, t) {
a.push($(t).data("provider-id"));
});
var o = $(".providers_list");
return 0 < a.length ? ($.ajax({
type: "POST",
url: s,
data: {
"providerIds[]": a
},
success: function(e) {
if (e.data) {
var t = e.data;
for (i = 0; i < t.length; i++) {
var a = o.find("tr[data-provider-id=" + t[i].provider_id + "]"), n = d;
t[i].balance && (n = t[i].balance), a.find("td").eq(1).html(n), a.removeClass("unload");
}
t.length && $('[data-toggle="tooltip"]').tooltip();
}
}
}), !0) : (r && clearInterval(r), l && clearTimeout(l), !1);
};
if (o()) var r = setInterval(o, 1e3 * c), l = setTimeout(function() {
clearInterval(r), $(".providers_list tr.unload").each(function(e, t) {
var a = $(t);
a.removeClass("unload"), a.find("td").eq(1).html(d);
}), $('[data-toggle="tooltip"]').tooltip();
}, 1e3 * u);
}(window);
}
}, customModule.subscriptionsController = {
run: function(n) {
$(".js_action").click(function(e) {
e.preventDefault();
var t = $(this), a = t.data("params");
custom.confirm(n.confirm_message, "", function() {
return custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
}), $("#subscriptionDetails").on("show.bs.modal", function(e) {
var n = $(this), t = $(e.relatedTarget).data("params");
custom.ajax({
url: t.get_details_url,
type: "GET",
success: function(e, t, a) {
if (void 0 === e.details) return n.modal("hide"), void console.log("Something was wrong...", t, a);
$("#body_subscription").empty().append(templates["admin/subscriptions_details"]({
details: e.details
}));
},
error: function(e, t, a) {
n.modal("hide"), console.log("Something was wrong...", t, a, e);
}
});
}), $("#subscriptionFailDetails").on("show.bs.modal", function(e) {
var n = $(this), t = $(e.relatedTarget).data("params");
custom.ajax({
url: t.get_details_url,
type: "GET",
success: function(e, t, a) {
if (void 0 === e.details) return n.modal("hide"), void console.log("Something was wrong...", t, a);
$("#body_fail_details").empty().append(templates["admin/subscriptions_fail_details"]({
details: e.details
}));
},
error: function(e, t, a) {
n.modal("hide"), console.log("Something was wrong...", t, a, e);
}
});
}), $("#subscriptionErrorDetails").on("show.bs.modal", function(e) {
var n = $(this), t = $(e.relatedTarget).data("params");
custom.ajax({
url: t.get_details_url,
type: "GET",
success: function(e, t, a) {
if (void 0 === e.details) return n.modal("hide"), void console.log("Something was wrong...", t, a);
$("#body_error_details").empty().append(templates["admin/subscriptions_error_details"]({
details: e.details
}));
},
error: function(e, t, a) {
n.modal("hide"), console.log("Something was wrong...", t, a, e);
}
});
}), $("#datePickerExpiry").datetimepicker({
format: "YYYY-MM-DD",
minDate: new Date()
}), $("#subscription-expiry-remove").on("click", function() {
var e = $(this).attr("data-target");
$(e).val("");
}), $("#editExpiry").on("show.bs.modal", function(e) {
var t = $(this), a = $(e.relatedTarget).data("params");
t.find("#datePickerExpiry").val(a.expiry), t.find("#subscription-expiry-id").val(a.id);
}), $("#editExpiry").find("form").submit(function(e) {
e.preventDefault();
var t = $(this), a = t.find(":submit");
custom.sendFrom(a, t, {
data: t.serialize(),
callback: function() {
location.reload();
}
});
}), $(".js_mass_action").click(function(e) {
e.preventDefault();
var t = $(this), a = t.data("params");
a || (a = {}), a.orders = [], $(".mass_item:checkbox:checked").each(function() {
a.orders.push($(this).val());
}), custom.confirm(n.confirm_message, "", function() {
return custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
location.reload();
}
}), !1;
});
}), $(".dropdown-load").on("show.bs.dropdown", function(e) {
var n = $(".dropdown-menu", this);
n.data("loaded") || custom.ajax({
url: $(this).data("load") + window.location.search,
type: "GET",
success: function(e, t, a) {
n.html(e).data("loaded", !0);
},
error: function(e, t, a) {
console.log("Something was wrong...", t, a, e), n.parents(".dropdown-load").removeClass("open");
}
});
});
}
}, customModule.tasksController = {
run: function(e) {
$(".taskDetails").click(function() {
!function(e) {
$.ajax({
url: e,
type: "GET",
dataType: "json",
success: function(e) {
!function(e) {
$("#task-provider").html(e.provider), $("#task-response").val(e.response), $("#last-updated").val(e.updated_at), 
$("#taskDetails").modal("show");
}(e);
}
});
}($(this).data("action"));
});
var a, n, o = $("#submitActionModal"), i = o.find("#actionSubmitButton"), r = {};
i.click(function(e) {
e.preventDefault(), custom.sendBtn(i, {
data: r,
type: "POST",
dataType: "json",
callback: function() {
o.modal("hide"), location.reload();
}
});
}), o.on("show.bs.modal", function(e) {
var t = $(e.relatedTarget);
a = t.data("action"), n = t.data("status"), r = {}, void 0 !== a ? (t.hasClass("mass_action") && (r.tasks = [], 
$(".mass_item:checkbox:checked").each(function() {
r.tasks.push($(this).val());
})), n && (r.status = n), i.attr("href", a)) : o.modal("hide");
}), o.on("hide.bs.modal", function(e) {
$(this).find("#actionSubmitButton").attr("href", "");
}), $(".dropdown-load").on("show.bs.dropdown", function(e) {
var n = $(".dropdown-menu", this);
n.data("loaded") || custom.ajax({
url: $(this).data("load"),
type: "GET",
success: function(e) {
n.html(e).data("loaded", !0);
},
error: function(e, t, a) {
n.parents(".dropdown-load").removeClass("open"), "abort" !== t && (console.log("Something was wrong...", t, a, e), 
custom.notify({
0: {
type: "danger",
text: a
}
}));
}
});
}), $(".js-show-details").on("click", function(e) {
e.preventDefault(), $("#myModalLabelTaskDetail").html($(this).data("title")), $("#taskDetailContent .modal-body-data").html(""), 
$("#taskDetailContent .modal-loader-wrap").show(), $("#taskDetail").modal("show"), 
custom.ajax({
url: $(this).data("action"),
type: "GET",
dataType: "json",
success: function(e) {
$("#taskDetailError").addClass("hidden"), $("#taskDetailContent .modal-body-data").html(custom.buildFields("taskDetailItem", e)), 
$("#taskDetailContent .modal-loader-wrap").hide();
},
error: function(e, t, a) {
"abort" !== t && (console.log("Something was wrong...", t, a, e), $("#taskDetailError").removeClass("hidden").text(a), 
$("#taskDetailContent .modal-loader-wrap").hide());
}
});
});
}
}, customModule.appearanceThemeFileController = {
run: function(n) {
var e = {};
switch (n.extension) {
case "twig":
e = {
mode: "text/html",
lineNumbers: !0,
profile: "xhtml",
lineWrapping: !0,
extraKeys: {
"Ctrl-Q": function(e) {
e.foldCode(e.getCursor());
}
},
foldGutter: !0,
gutters: [ "CodeMirror-linenumbers", "CodeMirror-foldgutter" ],
onKeyEvent: function(e, t) {
if ((122 == t.keyCode || 27 == t.keyCode) && "keydown" == t.type) return t.stop(), 
a();
}
};
break;

case "css":
e = {
mode: "text/css",
lineNumbers: !0,
lineWrapping: !0,
extraKeys: {
"Ctrl-Q": function(e) {
e.foldCode(e.getCursor());
}
},
foldGutter: !0,
gutters: [ "CodeMirror-linenumbers", "CodeMirror-foldgutter" ],
onKeyEvent: function(e, t) {
if ((122 == t.keyCode || 27 == t.keyCode) && "keydown" == t.type) return t.stop(), 
a();
}
};
break;

case "js":
e = {
mode: "text/javascript",
lineNumbers: !0,
lineWrapping: !0,
extraKeys: {
"Ctrl-Q": function(e) {
e.foldCode(e.getCursor());
}
},
foldGutter: !0,
gutters: [ "CodeMirror-linenumbers", "CodeMirror-foldgutter" ],
onKeyEvent: function(e, t) {
if ((122 == t.keyCode || 27 == t.keyCode) && "keydown" == t.type) return t.stop(), 
a();
}
};
break;

default:
e = {
lineNumbers: !0,
lineWrapping: !0,
foldGutter: !0,
gutters: [ "CodeMirror-linenumbers", "CodeMirror-foldgutter" ],
onKeyEvent: function(e, t) {
if ((122 == t.keyCode || 27 == t.keyCode) && "keydown" == t.type) return t.stop(), 
a();
}
};
}
function a() {
var e = $(".CodeMirror-scroll");
e.hasClass("fullscreen") ? (e.removeClass("fullscreen"), e.height(a.beforeFullscreen.height), 
e.width(a.beforeFullscreen.width), editor.refresh(), $(".fullscreen-blockFull").remove()) : (a.beforeFullscreen = {
height: e.height(),
width: e.width()
}, e.addClass("fullscreen"), e.height("100%"), e.width("100%"), editor.refresh(), 
e.append('<div class="fullscreen-blockFull"><a href="#" class="btn btn-sm btn-default fullScreenButtonOff"><span class="fa fa-compress" style="font-size: 18px; position: absolute; left: 6px; top: 4px;"></span></a> </div>'));
}
$("body").hasClass("dark-mode") ? e.theme = "material-darker" : e.theme = "default", 
window.CodeMirrorEditor = CodeMirror.fromTextArea(document.getElementById("editthemeform-code"), e), 
$(document).on("click", ".fullScreenButton", function(e) {
a();
}), $(document).on("click", ".fullScreenButtonOff", function(e) {
a();
}), $(document).keyup(function(e) {
27 == e.keyCode && 1 <= $(".fullscreen").length && a();
}), $("#editFile").submit(function(e) {
$("body").addClass("page-loader");
}), $(".js-confirm").click(function(e) {
var t = $(this), a = t.data("params");
custom.confirm(n.confirm_message, "", function() {
$("body").addClass("page-loader"), custom.sendBtn(t, {
data: a,
type: "POST",
callback: function() {
window.location = location.href;
}
});
}), e.preventDefault();
});
}
}, customModule.ticketsController = {
run: function(n) {
$(document).on("click", "#createTicketButton", function(e) {
e.preventDefault();
var t = $(this), a = $("#createTicketForm");
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function(e) {
$("#createTicketModal").modal("hide"), location.reload();
}
}), !1;
}), $(document).on("click", "#editMessageButton", function(e) {
e.preventDefault();
var t = $(this), a = $("#editTicketMessageForm");
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function(e) {
$("#editMessage").modal("hide"), location.reload();
}
}), !1;
}), $("#confirmAction").on("show.bs.modal", function(e) {
$("#TicketsFormStatus").val($(e.relatedTarget).data("id"));
}), $("#editMessage").on("show.bs.modal", function(e) {
var t = $(e.relatedTarget).data("link"), a = $("#editMessage"), o = $(".modal-body", a);
o.html('<span class="spinner"><i class="fa fa-spinner fa-spin"></i></span>'), custom.ajax({
url: t,
type: "GET",
success: function(e) {
o.html(e.content);
},
error: function(e, t, a) {
if ("abort" !== t) {
console.log("Something was wrong...", t, a, e);
var n = $("<div/>", {
class: "error-summary alert alert-danger"
}).text(a);
o.html("").append(n);
}
}
});
}), $("#confirmTicket").on("show.bs.modal", function(e) {
var t, a = $(e.relatedTarget);
$("#confirmTicketTitle").html(n[a.data("title")]), $("#confirmTicketLink").attr("href", a.data("link")), 
t = !!a.data("submit_danger"), $("#confirmTicketLink").toggleClass("btn-danger", t);
}), $(document).on("click", "#checkActionYes", function(e) {
$("#bulkTicketForm").submit();
}), $("#editTicketSubject").on("show.bs.modal", function(e) {
var t = $(e.relatedTarget);
$("#edit-ticket-subject").val(t.data("subject")), $("#editSubjectForm").attr("action", t.data("url"));
}), $("#editSubjectForm").on("submit", function(e) {
e.preventDefault();
var t = $("#editSubjectBtn"), a = $(this);
return custom.sendFrom(t, a, {
data: a.serialize(),
callback: function(e) {
$("#editTicketSubject").modal("hide"), location.reload();
}
}), !1;
});
}
}, customModule.usersControllerExport = {
run: function(e) {
e.exportFromDate || new Date();
var t = e.exportToDate || new Date();
e.checkExportStatusUrl;
window, $('[data-toggle="tooltip"]').tooltip(), $(".selectpicker").selectpicker({
style: "btn-default",
size: "auto"
}), $("#exportFrom").datetimepicker({
format: "YYYY-MM-DD",
maxDate: t
}), $("#exportTo").datetimepicker({
format: "YYYY-MM-DD",
maxDate: t
}), $("#customizeFieldsModal .cancel_button").click(function(e) {
$("#customizeFieldsModal input:checkbox").prop("checked", !0);
});
}
}, customModule.usersController = {
run: function(d) {
var t, a, n, o, i, r, l, s, c, m, u, p, f, h, v, b, g, y, w, k, x, C, M, F, D, T, S, E, L, P, j, O = d.passwordLength || 8;
function I(t, e) {
t.find(".user_list_item").remove();
var a = _.template('<option class="user_list_item" data-tokens="<%= login %><%= id %><%- custom_rates %>" value="<%- id %>"><%= login %> (<%= custom_rates %>)</option>');
_.each(e, function(e) {
t.append(a({
id: e.id,
login: e.login,
custom_rates: e.custom_rates
}));
}), t.selectpicker("refresh");
}
$(".edit_rates_btn").prop("disabled", !1), window, t = $("#createUserModal"), a = t.find("form"), 
n = t.find(":submit"), o = custom.freezeForm(a), a.submit(function(e) {
e.preventDefault(), custom.sendFrom(n, a, {
data: $(this).serialize(),
callback: function(e) {
t.modal("hide"), location.reload();
}
});
}), a.find(".generate_password_btn").click(function(e) {
a.find(".form_field_password").val(custom.generatePassword(O));
}), t.on("hide.bs.modal", function(e) {
custom.restoreForm(o, a), t.find(".error-summary").addClass("hidden");
}), t.on("show.bs.modal", function(e) {
console.log($(this)), $(this).find('input[type="text"]').val([]), console.log($(this).find('input[type="text"]'));
}), function(e) {
d.passwordLength;
var n, o, i, r = $("#editUserModal"), s = r.find("form"), t = r.find(":submit"), a = r.find(".generate_apikey_btn"), l = custom.freezeForm(s);
s.submit(function(e) {
e.preventDefault(), custom.sendFrom(t, s, {
data: $(this).serialize(),
callback: function(e) {
r.modal("hide"), location.reload();
}
});
}), a.click(function(e) {
custom.ajax({
url: n,
type: "GET",
success: function(e, t, a) {
e && _.isString(e) && r.find(".form_field_apikey").val(e);
},
error: function(e, t, a) {
console.log("Something was wrong...", t, a, e);
}
});
}), r.on("shown.bs.modal", function(e) {
s.attr("action", o);
}), r.on("show.bs.modal", function(e) {
var t = $(e.relatedTarget), a = t.closest("tr").attr("id");
o = t.data("action_url"), i = t.data("get_url"), n = t.data("generate_apikey_url"), 
custom.restoreForm(l, s), r.find(".modal-title .item-id").html(a), custom.ajax({
url: i,
type: "GET",
success: function(e, t, a) {
if (void 0 === e.user) return r.modal("hide"), void console.log("Unexpected user data...", t, a);
!function(e) {
var t, a, n, o, i = JSON.parse(e.payments || "{}"), r = {
"UpdateUserForm[username]": e.login,
"UpdateUserForm[email]": e.email,
"UpdateUserForm[skype]": e.skype,
"UpdateUserForm[first_name]": e.first_name,
"UpdateUserForm[last_name]": e.last_name,
"UpdateUserForm[cpf]": e.cpf,
"UpdateUserForm[apikey]": e.apikey
}, l = {};
s.find("input").each(function() {
a = this.name, (t = $(this)) && "checkbox" === t.attr("type") && (o = a.match(/(\[([^[]+)\])(\[([^[]+)\])/), 
_.isArray(o) && void 0 !== o[4] && (n = o[4], l[a] = i.hasOwnProperty(n) ? 0 | i[n] : 1));
}), r = _.extend(r, l), custom.restoreForm(JSON.stringify(r), s);
}(e.user);
},
error: function(e, t, a) {
r.modal("hide"), console.log("Something was wrong...", t, a, e);
}
});
});
}(window), window, l = $("#submitActionModal"), s = l.find("#actionSubmitButton"), 
c = {}, s.click(function(e) {
e.preventDefault(), "POST" === r && custom.sendBtn(s, {
data: c,
type: "POST",
callback: function(e) {
l.modal("hide"), location.reload();
}
});
}), l.on("show.bs.modal", function(e) {
var t = $(e.relatedTarget);
if (i = t.data("action_url"), r = t.data("action_type"), c = {}, void 0 === i) return l.modal("hide"), 
void console.log("Undefined submit modal dialog action url!");
t.hasClass("mass_action") && "POST" === r && (c.users = [], $(".mass_item:checkbox:checked").each(function() {
c.users.push($(this).val());
})), s.attr("href", i);
}), l.on("hide.bs.modal", function(e) {
$(this).find("#actionSubmitButton").attr("href", "");
}), window, m = $("#setPassword"), u = m.find("form"), p = m.find(":submit"), f = u.find(".form_field_password"), 
h = u.find(".form_field_username"), v = u.find(".form_fields"), u.submit(function(e) {
e.preventDefault(), custom.sendFrom(p, u, {
data: $(this).serialize(),
callback: function(e) {
m.modal("hide"), location.reload();
}
});
}), u.find(".generate_password_button").click(function(e) {
f.val(custom.generatePassword(O));
}), m.on("show.bs.modal", function(e) {
var t = $(e.relatedTarget), a = t.data("action_url"), n = t.data("username");
m.find(".modal-title .item-id").html(t.closest("tr").attr("id")), v.val(""), void 0 !== a && void 0 !== n ? (u.attr("action", a), 
h.val(n)) : console.log("Undefined submit modal dialog action url!");
}), function(e) {
var n, o, i, r, l = $("#editRatesModal"), s = l.find("form"), t = l.find(".submit_button"), d = l.find(".rates_list_container"), a = l.find(".detele_all_button"), c = l.find(".select_service_container"), m = (l.find(".clear_search"), 
l.find(".search_custom_rates")), u = [], p = 0;
function f(a, n) {
d.animate({
scrollTop: a.offset().top - d.offset().top + d.scrollTop()
}, 500, function() {
var e = n || "#DDEDF6", t = a.css("background-color");
a.css("backgroundColor", e).animate({
backgroundColor: t
}, 1e3, function() {
a.css("backgroundColor", t);
});
});
}
d.on("click", ".delete_rate_button", function(e) {
var t = $(this).closest(".rate_item");
t.remove(), g(--p);
}), d.on("click", ".rate_type_button", function(e) {
var t = $(this).closest(".rate_item"), a = 0 | t.find(".field_percent").val(), n = 0 | !a, o = t.find(".field_price"), i = t.data("dollar_price"), r = t.data("percent_price"), l = t.data("raw_price");
t.find(".field_percent").val(n).change(), n ? o.val(null === r ? 100 : r) : o.val(null === i ? l : i);
}), d.on("change", ".field_price", function(e) {
var t = $(this).closest(".rate_item"), a = 0 | t.find(".field_percent").val(), n = $(this).val();
a ? t.data("percent_price", n) : t.data("dollar_price", n);
}), d.on("change", ".field_percent", function(e) {
var t = $(this).closest(".rate_item"), a = 0 | t.find(".field_percent").val(), n = a ? "%" : "$";
t.find(".rate_type_button").text(n), y(t, a);
});
var h = _.debounce(function(e) {
var t = $(".rates_list_container .rate_item");
t.each(function() {
$(this).text().search(new RegExp(e, "i")) < 0 ? $(this).hide() : $(this).show();
}), d.toggleClass("custom-rates__service-search", !!t.filter(":visible").length);
}, 200);
function v() {
u = function(e) {
var t = [];
return _.each(e, function(e) {
_.isArray(e.services) && (t = _.union(t, e.services));
}), t;
}(r), c.append(function(e) {
var t, a, n = $("#add_custom_rate_item_js_template");
if (0 === n.length) throw "Undefined services list template";
return t = _.template(n.html()), (a = $($.parseHTML(t({
groupedServices: e
})))).find(".field_service").selectpicker(), a.on("changed.bs.select", function(e, t, a, n) {
var o = $(this).find("option").eq(t).val(), i = function() {
return $("#item_" + o);
};
if (i().length) f(i()); else {
var r = b(u, o);
d.append(w({
id: null,
sid: o,
price: r.price,
percent: "0"
})), _.defer(function() {
f(i(), "#DDEDF6"), $('[data-toggle="tooltip"]').tooltip();
});
}
i().find(".field_price").focus();
}), a;
}(r)), 0 < i.length && (_.each(i, function(e) {
_.defer(function() {
d.append(w(e));
});
}), _.defer(function() {
d.find(".field_price").trigger("change"), d.find(".field_percent").trigger("change"), 
$('[data-toggle="tooltip"]').tooltip();
})), _.delay(custom.showModalLoader, 500, !1);
}
function b(e, t) {
return _.find(e, function(e) {
return parseInt(e.id) === parseInt(t);
});
}
function g(e) {
a.attr("disabled", !e).prop("disabled", !e), t.prop("disabled", !e && !i);
}
function y(e, t) {
var a = e.find(".field_price");
t ? a.inputmask("integer", {
integerDigits: 8,
allowMinus: !1,
autoGroup: !1,
min: 0,
step: 1,
placeholder: "0",
rightAlign: !1,
oncleared: function() {
a.val(0);
}
}) : a.inputmask("numeric", {
digits: 3,
integerDigits: 17,
enforceDigitsOnBlur: !0,
allowMinus: !1,
autoGroup: !1,
min: 0,
step: .001,
placeholder: "0.000",
rightAlign: !1,
oncleared: function() {
a.val(0);
}
});
}
function w(e) {
var t, a, n, o = $("#custom_rate_item_js_template");
if (0 === o.length) throw "Undefined services list template";
t = _.template(o.html()), n = b(u, e.sid);
var i = 0 | e.percent;
return (a = $($.parseHTML(t({
rate_id: e.id,
service_id: e.sid,
custom_rate: e.price,
percent: i,
service_name: n.service_name,
service_rate: n.price,
provider_rate: n.provider_rate,
provider_rate_tooltip: n.provider_rate_tooltip,
activity: 0 | n.act
})))).data("dollar_price", i ? null : e.price), a.data("percent_price", i ? e.price : null), 
a.data("raw_price", n.price), y(a, 0 | e.percent), g(++p), a;
}
function k() {
m.val("").trigger("keyup");
}
s.submit(function(e) {
e.preventDefault(), custom.sendFrom(t, s, {
data: $(this).serialize(),
callback: function(e) {
l.modal("hide"), _.delay(function() {
location.reload();
}, 500);
}
});
}), $(document).on("click", ".delete_all_submit", function() {
d.empty(), g(0);
}), m.keydown(function(e) {
if (13 === e.keyCode) return e.preventDefault(), !1;
27 === e.keyCode && (e.preventDefault(), e.stopImmediatePropagation(), k());
}), m.keyup(function(e) {
var t = $(this).val().trim();
h(t);
}), l.on("click", ".clear-button-live-search", function(e) {
k();
}), l.on("shown.bs.modal", function() {
_.defer(function() {
m.jQueryClearButton();
});
}), l.on("show.bs.modal", function(e) {
var t = $(e.relatedTarget);
n = t.data("action_url"), o = t.data("get_rates_url");
var a = t.closest("tr").attr("id");
l.find(".modal-title .item-id").html(a), l.find(".error-summary").addClass("hidden"), 
void 0 !== n ? (u = r = i = null, g(p = 0), d.empty(), c.empty(), m.val(""), custom.showModalLoader(!0), 
custom.ajax({
url: o,
type: "GET",
success: function(e, t, a) {
if (r = e.services, i = e.custom_rates, void 0 === r || void 0 === i) return l.modal("hide"), 
void console.log("Unexpected custom rates data...", t, a);
v();
},
error: function(e, t, a) {
custom.showModalLoader(!1), l.modal("hide"), console.log("Something was wrong...", t, a, e);
}
}), s.attr("action", n)) : console.log("Undefined submit modal dialog action url!");
});
}(window), window, w = $("#copyRatesModal"), k = w.find("form"), x = w.find(":submit"), 
C = w.find(".users_from_list"), M = w.find(".current_user_name"), F = w.find(".form_field_to"), 
k.submit(function(e) {
e.preventDefault(), custom.sendFrom(x, k, {
data: $(this).serialize(),
callback: function(e) {
w.modal("hide"), location.reload();
}
});
}), C.change(function(e) {
var t, a = $(this).val();
t = void 0 === y || null == a, x.prop("disabled", t), k.attr("action", b.replace("from_id", a).replace("to_id", y));
}), w.on("show.bs.modal", function(e) {
var t, a = $(e.relatedTarget);
y = a.data("user_id"), b = a.data("action_url"), g = a.data("get_users_url"), t = a.data("username"), 
w.find(".modal-title .item-id").html(a.closest("tr").attr("id")), void 0 !== y && void 0 !== b && void 0 !== g || w.modal("hide"), 
custom.ajax({
url: g,
type: "GET",
success: function(e, t, a) {
e || w.modal("hide"), I(C, e);
},
error: function(e, t, a) {
console.log("Something was wrong...", t, a, e);
}
}), C.val("").change(), C.find("option").prop("disabled", !1), C.find('option[value=""]').prop("disabled", !0), 
C.find("option[value='" + y + "']").prop("disabled", !0), C.selectpicker("refresh"), 
M.val(t), F.val(y);
}), function(e) {
var t = document.querySelector(".checkAll"), n = t.closest("tr"), o = document.querySelectorAll(".selectOrder"), i = document.querySelector(".countOrders"), r = 0;
function a() {
r = 0;
var a = !1;
return o.forEach(function(e) {
var t = e.closest("tr");
e.checked ? (r++, a = !0, t.classList.add("active")) : t.classList.remove("active");
}), a ? (t.checked = !0, i.innerText = r + " users ", n.classList.add("show-action-menu"), 
!0) : (t.checked = !1, n.classList.remove("show-action-menu"), !1);
}
t.addEventListener("change", function() {
r = 0, this.checked ? (o.forEach(function(e) {
e.disabled || (e.closest("tr").classList.add("active"), n.classList.add("show-action-menu"), 
e.checked = !0, r++);
}), i.innerText = r + " users ") : (o.forEach(function(e) {
e.closest("tr").classList.remove("active"), n.classList.remove("show-action-menu"), 
e.checked = !1;
}), r = 0, this.checked = !1, i.innerText = "");
}), o.forEach(function(e) {
e.addEventListener("change", a);
});
}(window), window, D = $("#copyRatesMassModal"), T = D.find("form"), S = D.find(":submit"), 
E = D.find(".users_from_list"), L = D.find(".users_to_list"), P = L.clone(), T.submit(function(e) {
e.preventDefault(), L.prop("disabled", !1).find("option").prop("selected", !0), 
custom.sendFrom(S, T, {
data: $(this).serialize(),
callback: function(e) {
D.modal("hide"), location.reload();
}
}), L.prop("disabled", !0).find("option").prop("selected", !1);
}), E.change(function(e) {
var t, a = $(this).val();
t = null == a, S.prop("disabled", t);
}), D.on("show.bs.modal", function(e) {
var t = $(e.relatedTarget).data("get_users_url");
E.val("").change(), L.empty(), $(".mass_item:checkbox:checked").each(function() {
L.append(P.find("option[value='" + $(this).val() + "']").clone());
}), custom.ajax({
url: t,
type: "GET",
success: function(e, t, a) {
e || D.modal("hide"), I(E, e);
},
error: function(e, t, a) {
console.log("Something was wrong...", t, a, e);
}
});
}), window, (j = $("#viewActivityLogModal")).on("show.bs.modal", function(e) {
var t = $(e.relatedTarget), a = (t.data("user_id"), t.data("get_log_url")), n = $(".activity_log tbody", j).empty();
void 0 !== j.find(".modal-title .item-id").html(t.closest("tr").attr("id")) && void 0 !== a || j.modal("hide"), 
custom.ajax({
url: a,
type: "GET",
success: function(e, t, a) {
e && _.isArray(e) || j.modal("hide"), n.empty().append(templates["admin/users_activity_log_rows"]({
rows: e
}));
},
error: function(e, t, a) {
j.modal("hide"), console.log("Something was wrong...", t, a, e);
}
});
});
}
};