import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclechat_v1/repo/user.dart';
import 'package:unclechat_v1/util/const.dart';
import 'package:easy_localization/easy_localization.dart';

class InfoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final _thisYear = DateTime.now().year;

  final _genders = ['Nam', 'Nữ', 'LGBT'];
  final _regions = ['Miền Nam', 'Miền Trung', 'Miền Bắc', 'Nước ngoài'];

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
        hintText: 'fill_your_nickname'.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.minLength(context, 3),
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
      valueTransformer: num.tryParse,
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
        [FormBuilderValidators.required(context)],
      ),
      valueTransformer: convertToStandardGender,
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
        [FormBuilderValidators.required(context)],
      ),
      valueTransformer: convertToStandardRegion,
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
            final info = _formKey.currentState.value;
            context.read<UserRepo>().updateUserInfo(info);
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
