import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
/* create collection references,  *
*  define the name of collection  *
*  (question_papers) on the cloud *
*  firestore rules.               */
final questionPaperRF = fireStore.collection('question_papers');

/* create reference method as DocumentReference */
DocumentReference questionRF(
        {
        /* set parameters*/
        required String paperId,
        required String questionId}) =>
    /* we looking for paperId as parent of the questions and then create *
    *  collection name called "questions" with the neme of questionId.   */
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);

/* initiate instance for firebase storage */
Reference get firebaseStorage => FirebaseStorage.instance.ref();
