Return-Path: <jesse.r.kleve@lmco.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A98BE00A64; Tue,  4 Sep 2018 17:59:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.35.12 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1815 seconds by postgrey-1.32 at yocto-www;
	Tue, 04 Sep 2018 17:59:32 PDT
Received: from mailfo02.lmco.com (mailfo02.lmco.com [192.35.35.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41B8DE00A39
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Sep 2018 17:59:32 -0700 (PDT)
Received: from lmxpdend11w04.us.lmco.com (lmxpdend11w04.ems.lmco.com
	[172.23.20.75])
	by mailfo02.lmco.com (8.16.0.21/8.16.0.21) with ESMTP id w850TE5l002322
	for <meta-virtualization@yoctoproject.org>; Wed, 5 Sep 2018 00:29:15 GMT
Received: from lmxpdend11w03.us.lmco.com (172.23.20.74) by
	lmxpdend11w04.us.lmco.com (172.23.20.75) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1466.3; Tue, 4 Sep 2018 18:29:13 -0600
Received: from lmxpdend11w03.us.lmco.com ([172.23.20.74]) by
	lmxpdend11w03.us.lmco.com ([172.23.20.74]) with mapi id 15.01.1466.003;
	Tue, 4 Sep 2018 18:29:13 -0600
From: "Kleve, Jesse R" <jesse.r.kleve@lmco.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: xen-image-minimal: "No package kernel-module-xen-* available"
Thread-Index: AQHURK945mmR/fUrvEOphQRHtRV5OA==
Date: Wed, 5 Sep 2018 00:29:13 +0000
Message-ID: <58F40E73-9AC1-4BA3-A372-5E3BB48C4129@lmco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.0.180812
x-originating-ip: [172.23.20.17]
MIME-Version: 1.0
X-LM-Outbound: External 172.23.20.75 cntry=**
	g=DZnA5eycrS40b0bDUGXmH5H5WaYF1xFQ q=w850TE5l002322 m=1
X-LM-OSENDER: jesse.r.kleve@lmco.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-09-04_14:, , signatures=0
Subject: xen-image-minimal: "No package kernel-module-xen-* available"
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2018 00:59:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1CE9ECFBD4B5F4CB65ABBD92422D824@exch.ems.lmco.com>
Content-Transfer-Encoding: base64

V2hlbiBidWlsZGluZyB4ZW4taW1hZ2UtbWluaW1hbCBmcm9tIG1ldGEtdmlydHVhbGl6YXRpb24g
KHB5cm8pLCBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9yIGluIGRvX3Jvb3RmczoNCg0KRVJST1I6
IENvdWxkIG5vdCBpbnZva2UgZG5mLiBDb21tYW5kICcvZGlzazAxL3VzZXJzL2prbGV2ZS94aWxp
bngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vYnVpbGRfemN1MTAyLXp5bnFt
cC90bXAvd29yay96Y3UxMDJfenlucW1wLXBva3ktbGludXgveGVuLWltYWdlLW1pbmltYWwvMS4w
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2RuZiAteSAtYyAvZGlzazAxL3VzZXJz
L2prbGV2ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vYnVpbGRf
emN1MTAyLXp5bnFtcC90bXAvd29yay96Y3UxMDJfenlucW1wLXBva3ktbGludXgveGVuLWltYWdl
LW1pbmltYWwvMS4wLXIwL3Jvb3Rmcy9ldGMvZG5mL2RuZi5jb25mIC0tc2V0b3B0PXJlcG9zZGly
PS9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nk
cy15b2N0by9idWlsZF96Y3UxMDItenlucW1wL3RtcC93b3JrL3pjdTEwMl96eW5xbXAtcG9reS1s
aW51eC94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvcm9vdGZzL2V0Yy95dW0ucmVwb3MuZCAtLXJl
cG9mcm9tcGF0aD1vZS1yZXBvLC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9zZHMvcHJvamVj
dDctbm8tcGV0YWxpbnV4L3Nkcy15b2N0by9idWlsZF96Y3UxMDItenlucW1wL3RtcC93b3JrL3pj
dTEwMl96eW5xbXAtcG9reS1saW51eC94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvb2Utcm9vdGZz
LXJlcG8gLS1pbnN0YWxscm9vdD0vZGlzazAxL3VzZXJzL2prbGV2ZS94aWxpbngvc2RzL3Byb2pl
Y3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vYnVpbGRfemN1MTAyLXp5bnFtcC90bXAvd29yay96
Y3UxMDJfenlucW1wLXBva3ktbGludXgveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3Jvb3RmcyAt
LXNldG9wdD1sb2dkaXI9L2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1u
by1wZXRhbGludXgvc2RzLXlvY3RvL2J1aWxkX3pjdTEwMi16eW5xbXAvdG1wL3dvcmsvemN1MTAy
X3p5bnFtcC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC90ZW1wIC0tbm9ncGdj
aGVjayBpbnN0YWxsIGxvY2FsZS1iYXNlLWVuLXVzIGxvY2FsZS1iYXNlLWVuLWdiIHFlbXUgeGVu
LWJhc2Uga2VybmVsLW1vZHVsZS14ZW4tZ250ZGV2IHBhY2thZ2Vncm91cC1jb3JlLWJvb3QgbGli
dmlydCBrZXJuZWwtbW9kdWxlLXhlbi13ZHQga2VybmVsLW1vZHVsZS14ZW4tbmV0YmFjayBrZXJu
ZWwtbW9kdWxlLXhlbi1ibGtiYWNrIGtlcm5lbC1tb2R1bGUteGVuLWdudGFsbG9jIHBhY2thZ2Vn
cm91cC1jb3JlLXNzaC1vcGVuc3NoIHJ1bi1wb3N0aW5zdHMnIHJldHVybmVkIDE6DQpBZGRlZCBv
ZS1yZXBvIHJlcG8gZnJvbSBmaWxlOi8vL2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9w
cm9qZWN0Ny1uby1wZXRhbGludXgvc2RzLXlvY3RvL2J1aWxkX3pjdTEwMi16eW5xbXAvdG1wL3dv
cmsvemN1MTAyX3p5bnFtcC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC9vZS1y
b290ZnMtcmVwbw0KTGFzdCBtZXRhZGF0YSBleHBpcmF0aW9uIGNoZWNrOiAwOjAwOjAxIGFnbyBv
biBXZWQgU2VwIDA1IDAwOjE3OjU0IDIwMTggVVRDLg0KTm8gcGFja2FnZSBrZXJuZWwtbW9kdWxl
LXhlbi1nbnRkZXYgYXZhaWxhYmxlLg0KTm8gcGFja2FnZSBrZXJuZWwtbW9kdWxlLXhlbi13ZHQg
YXZhaWxhYmxlLg0KTm8gcGFja2FnZSBrZXJuZWwtbW9kdWxlLXhlbi1uZXRiYWNrIGF2YWlsYWJs
ZS4NCk5vIHBhY2thZ2Uga2VybmVsLW1vZHVsZS14ZW4tYmxrYmFjayBhdmFpbGFibGUuDQpObyBw
YWNrYWdlIGtlcm5lbC1tb2R1bGUteGVuLWdudGFsbG9jIGF2YWlsYWJsZS4NCkVycm9yOiBVbmFi
bGUgdG8gZmluZCBhIG1hdGNoDQoNCg0KDQpXaGVyZSBkbyB0aGVzZSBwYWNrYWdlcyBleGlzdD8g
QW0gSSBtaXNzaW5nIGEgbGF5ZXI/IE15IGJibGF5ZXJzIGlzIHNldCB0bzoNCg0KICAvZGlzazAx
L3VzZXJzL2prbGV2ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8v
c291cmNlcy9wb2t5L21ldGEgXA0KICAvZGlzazAxL3VzZXJzL2prbGV2ZS94aWxpbngvc2RzL3By
b2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9wb2t5L21ldGEtcG9reSBcDQog
IC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nk
cy15b2N0by9zb3VyY2VzL3Bva3kvbWV0YS15b2N0by1ic3AgXA0KICAvZGlzazAxL3VzZXJzL2pr
bGV2ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9t
ZXRhLW9wZW5lbWJlZGRlZC9tZXRhLWVmbCBcDQogIC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlu
eC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nkcy15b2N0by9zb3VyY2VzL21ldGEtb3BlbmVt
YmVkZGVkL21ldGEtZmlsZXN5c3RlbXMgXA0KICAvZGlzazAxL3VzZXJzL2prbGV2ZS94aWxpbngv
c2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRhLW9wZW5lbWJl
ZGRlZC9tZXRhLWdub21lIFwNCiAgL2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9q
ZWN0Ny1uby1wZXRhbGludXgvc2RzLXlvY3RvL3NvdXJjZXMvbWV0YS1vcGVuZW1iZWRkZWQvbWV0
YS1ncGUgXA0KICAvZGlzazAxL3VzZXJzL2prbGV2ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBl
dGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRhLW9wZW5lbWJlZGRlZC9tZXRhLWluaXRyYW1m
cyBcDQogIC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9zZHMvcHJvamVjdDctbm8tcGV0YWxp
bnV4L3Nkcy15b2N0by9zb3VyY2VzL21ldGEtb3BlbmVtYmVkZGVkL21ldGEtbXVsdGltZWRpYSBc
DQogIC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4
L3Nkcy15b2N0by9zb3VyY2VzL21ldGEtb3BlbmVtYmVkZGVkL21ldGEtbmV0d29ya2luZyBcDQog
IC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nk
cy15b2N0by9zb3VyY2VzL21ldGEtb3BlbmVtYmVkZGVkL21ldGEtb2UgXA0KICAvZGlzazAxL3Vz
ZXJzL2prbGV2ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291
cmNlcy9tZXRhLW9wZW5lbWJlZGRlZC9tZXRhLXBlcmwgXA0KICAvZGlzazAxL3VzZXJzL2prbGV2
ZS94aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRh
LW9wZW5lbWJlZGRlZC9tZXRhLXB5dGhvbiBcDQogIC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlu
eC9zZHMvcHJvamVjdDctbm8tcGV0YWxpbnV4L3Nkcy15b2N0by9zb3VyY2VzL21ldGEtb3BlbmVt
YmVkZGVkL21ldGEtcnVieSBcDQogIC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9zZHMvcHJv
amVjdDctbm8tcGV0YWxpbnV4L3Nkcy15b2N0by9zb3VyY2VzL21ldGEtb3BlbmVtYmVkZGVkL21l
dGEtc3lzdGVtZCBcDQogIC9kaXNrMDEvdXNlcnMvamtsZXZlL3hpbGlueC9zZHMvcHJvamVjdDct
bm8tcGV0YWxpbnV4L3Nkcy15b2N0by9zb3VyY2VzL21ldGEtb3BlbmVtYmVkZGVkL21ldGEtd2Vi
c2VydmVyIFwNCiAgL2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1w
ZXRhbGludXgvc2RzLXlvY3RvL3NvdXJjZXMvbWV0YS1vcGVuZW1iZWRkZWQvbWV0YS14ZmNlIFwN
CiAgL2Rpc2swMS91c2Vycy9qa2xldmUveGlsaW54L3Nkcy9wcm9qZWN0Ny1uby1wZXRhbGludXgv
c2RzLXlvY3RvL3NvdXJjZXMvbWV0YS14aWxpbnggXA0KICAvZGlzazAxL3VzZXJzL2prbGV2ZS94
aWxpbngvc2RzL3Byb2plY3Q3LW5vLXBldGFsaW51eC9zZHMteW9jdG8vc291cmNlcy9tZXRhLXZp
cnR1YWxpemF0aW9uDQrigJwNCg0KTXkgbG9jYWwuY29uZiBpcyBtb3N0bHkgZGVmYXVsdCB3aXRo
IGEgZmV3IG1vZGlmaWNhdGlvbnMuDQoNCk1BQ0hJTkUgPSDigJx6Y3UxMDItenlucW1w4oCdDQpJ
TUFHRV9JTlNUQUxMICs9IOKAnGxpYnZpcnTigJ0NCkRJU1RSTyA9IOKAnHBva3nigJ0NCkRJU1RS
T19GRUFUVVJFUyArPSDigJx4MTEgeGVuIHZpcnR1YWxpemF0aW9u4oCdDQo=

