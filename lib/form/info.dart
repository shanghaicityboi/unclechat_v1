import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InfoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final _thisYear = DateTime.now().year;

  final List<String> _genders = ['Male', 'Female', 'LGBT'];
  final List<String> _regions = ['Northern', 'Central', 'Southern', 'Foreign'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(
                  labelText: 'Nickname',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.minLength(context, 6),
                  FormBuilderValidators.maxLength(context, 16),
                ]),
                keyboardType: TextInputType.number,
              ),
              FormBuilderTextField(
                name: 'year',
                decoration: InputDecoration(
                  labelText: 'Birthyear',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.min(context, _thisYear - 45),
                  FormBuilderValidators.max(context, _thisYear - 13),
                ]),
                keyboardType: TextInputType.number,
              ),
              FormBuilderDropdown(
                name: 'gender',
                decoration: InputDecoration(
                  labelText: 'Gender',
                ),
                allowClear: true,
                hint: Text('Select Gender'),
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: _genders.map((gender) {
                  return DropdownMenuItem(value: gender, child: Text(gender));
                }).toList(),
              ),
              FormBuilderDropdown(
                name: 'region',
                decoration: InputDecoration(
                  labelText: 'Region',
                ),
                allowClear: true,
                hint: Text('Select Region'),
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: _regions.map((region) {
                  return DropdownMenuItem(value: region, child: Text(region));
                }).toList(),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          print(_formKey.currentState.value);
                        } else {
                          print("validation failed");
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState.reset();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
