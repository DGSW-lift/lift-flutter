
import 'package:lift/domain/member/model/member_model.dart';

class MemberProfileService {

  final MemberModel memberProfile;

  MemberProfileService(this.memberProfile);

  String getName(){
    return '${memberProfile.firstName} ${memberProfile.lastName}';
  }

  String getEmail(){
    return memberProfile.email;
  }

  String getImageURL() {
    return memberProfile.imgUrl ;
  }

}
