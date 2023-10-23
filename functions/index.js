const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();


const firestore = admin.firestore();


exports.onUserStatusChange = functions.database.ref("/{uid}/active").onUpdate(
    async (change, contex) =>{
      const isActive = change.after.val();
      const _firestore = firestore.doc(`users/${contex.params.uid}`);
      return _firestore.update({
        active: isActive,
        lastSeen: Date.now(),
      });
    },
);
