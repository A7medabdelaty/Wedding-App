import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding/core/common/custom_text_feild.dart';
import 'package:wedding/features/auth/data/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _price = TextEditingController();

  String name = "",
      phone = "",
      address = "",
      price = "";

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.profile.name ?? '';
    _phoneNumberController.text = widget.profile.phoneNumber ?? '';
    _address.text = widget.profile.address ?? '';
    _price.text = widget.profile.price ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFeild(hint: "Name",
              secure: false,
              icon: const Icon(Icons.person),
              type: TextInputType.name,
              validator: (value) {
                name = value!;
                return null;
              },
            ),
            const SizedBox(),
            CustomTextFeild(hint: "PhoneNumber",
              secure: false,
              icon: const Icon(Icons.phone),
              type: TextInputType.phone,
              validator: (value) {
                phone = value!;
                return null;
              },
            ),
            const SizedBox(),
            CustomTextFeild(
              hint: "Address",
              secure: false,
              icon: const Icon(Icons.location_city),
              type: TextInputType.text,
              validator: (value) {
                address = value!;
                return null;
              },
            ),
            const SizedBox(),
            CustomTextFeild(
              hint: "price",
              secure: false,
              icon: const Icon(Icons.price_change),
              type: TextInputType.phone,
              validator: (value) {
                price = value!;
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateProfile();
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateProfile() async {
    try {
      String newName = _nameController.text.trim();
      String newPhone = _phoneNumberController.text.trim();
      String newAddress = _address.text.trim();
      String newPrice = _price.text.trim();

      // Update only if the field is not empty and its value is different from the current profile value
      Map<String, dynamic> updateData = {};
      if (newName.isNotEmpty && newName != widget.profile.name) {
        updateData['name'] = newName;
      }
      if (newPhone.isNotEmpty && newPhone != widget.profile.phoneNumber) {
        updateData['phoneNumber'] = newPhone;
      }
      if (newAddress.isNotEmpty && newAddress != widget.profile.address) {
        updateData['address'] = newAddress;
      }
      if (newPrice.isNotEmpty && newPrice != widget.profile.price) {
        updateData['price'] = newPrice;
      }

      // Perform the update if there's any change
      if (updateData.isNotEmpty) {
        await FirebaseFirestore.instance.collection('photographers').doc(
            widget.profile.profileId).update(updateData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No changes detected'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update profile'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}