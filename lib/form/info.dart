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
              _buildNameField(context),
              _buildYearField(context),
              _buildGenderField(context),
              _buildRegionField(context),
              _buildFormButtons(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNameField(BuildContext context) {
    return FormBuilderTextField(
      name: 'name',
      decoration: InputDecoration(
        labelText: 'Nickname',
        filled: true,
        hintText: 'Fill your nickname',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.minLength(context, 6),
        FormBuilderValidators.maxLength(context, 16),
      ]),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildYearField(BuildContext context) {
    return FormBuilderTextField(
      name: 'year',
      decoration: InputDecoration(
        labelText: 'Birthyear',
        filled: true,
        hintText: 'Fill your birthyear',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.min(context, _thisYear - 45),
        FormBuilderValidators.max(context, _thisYear - 13),
      ]),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildGenderField(BuildContext context) {
    return FormBuilderDropdown(
      name: 'gender',
      decoration: InputDecoration(
        labelText: 'Gender',
        filled: true,
      ),
      allowClear: true,
      hint: Text('Select Gender'),
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context)]),
      items: _genders.map((gender) {
        return DropdownMenuItem(value: gender, child: Text(gender));
      }).toList(),
    );
  }

  Widget _buildRegionField(BuildContext context) {
    return FormBuilderDropdown(
      name: 'region',
      decoration: InputDecoration(
        labelText: 'Region',
        filled: true,
      ),
      allowClear: true,
      hint: Text('Select Region'),
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context)]),
      items: _regions.map((region) {
        return DropdownMenuItem(value: region, child: Text(region));
      }).toList(),
    );
  }

  Widget _buildFormButtons(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildSubmitButton(context),
        SizedBox(width: 5),
        _buildResetButton(context),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Expanded(
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
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return Expanded(
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
    );
  }
}
