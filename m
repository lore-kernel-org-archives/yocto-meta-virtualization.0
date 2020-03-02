Received: from 6.mo5.mail-out.ovh.net (6.mo5.mail-out.ovh.net [178.32.119.138])
 by mx.groups.io with SMTP id smtpd.web10.15121.1583159594309036158
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2020 06:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 178.32.119.138, mailfrom: norbert.kaminski@3mdeb.com)
Received: from player687.ha.ovh.net (unknown [10.110.171.250])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 7BD31271394
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  2 Mar 2020 15:33:12 +0100 (CET)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player687.ha.ovh.net (Postfix) with ESMTPSA id 808CCFE9950D;
	Mon,  2 Mar 2020 14:33:09 +0000 (UTC)
From: "Norbert Kaminski" <norbert.kaminski@3mdeb.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com
Subject: [PATCH] dev86: update SRC_URI and associated checksums
Date: Mon,  2 Mar 2020 15:32:38 +0100
Message-Id: <20200302143238.28949-1-norbert.kaminski@3mdeb.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1812417376788453809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddtgedgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpohhrsggvrhhtucfmrghmihnkshhkihcuoehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomheqnecuffhomhgrihhnpehvfedrshhkpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkeehrddvvddvrdduudejrddvvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieekjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehmvghtrgdqvhhirhhtuhgrlhhiiigrthhiohhnsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Piotr Kr=C3=B3l <piotr.krol@3mdeb.com>

SRC_URI no longer works, server return 503. Replace server with github
address.

Signed-off-by: Piotr Kr=C3=B3l <piotr.krol@3mdeb.com>
---
 recipes-extended/dev86/dev86_0.16.20.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/dev86/dev86_0.16.20.bb b/recipes-extended/d=
ev86/dev86_0.16.20.bb
index 38dbf8d..d93e487 100644
--- a/recipes-extended/dev86/dev86_0.16.20.bb
+++ b/recipes-extended/dev86/dev86_0.16.20.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c=
2336e835926c2166c28b"
 SECTION =3D "console/tools"
 PR=3D"r0"
=20
-SRC_URI=3D"http://v3.sk/~lkundrak/dev86/archive/Dev86src-${PV}.tar.gz"
+SRC_URI=3D"https://github.com/lkundrak/dev86/archive/v${PV}.tar.gz"
=20
-SRC_URI[md5sum] =3D "567cf460d132f9d8775dd95f9208e49a"
-SRC_URI[sha256sum] =3D "61817a378c8c8ba65f36c6792d457a305dc4eedae8cdc8b6=
233bf2bb28e5fe8d"
+SRC_URI[md5sum] =3D "288af53f256300777efc91d97c082fda"
+SRC_URI[sha256sum] =3D "533f2a0d2ed61223040f27e5cd007a11d969aaf34f6b709e=
ce122b1e6fc50580"
=20
 S =3D "${WORKDIR}/dev86-${PV}"
=20
--=20
2.17.1

