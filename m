Return-Path: <Alexandru.Vaduva@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25421E007EA; Tue, 29 Jul 2014 05:44:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 59263E007E4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jul 2014 05:44:07 -0700 (PDT)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Tue, 29 Jul 2014 14:44:01 +0200
From: Alexandru Vaduva <Alexandru.Vaduva@enea.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: meta-openstack open-iscsi question 
Thread-Index: Ac+rKsXN4WfeQ5fARaKfpp77exIkDQ==
Date: Tue, 29 Jul 2014 12:44:01 +0000
Message-ID: <DDB0C57E45663A458C5CACB7B5688BC21D6D568D@SESTOEX04.enea.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.184]
MIME-Version: 1.0
Cc: "bruce.ashfield@windriver.com" <bruce.ashfield@windriver.com>,
	"vu.tran@windriver.com" <vu.tran@windriver.com>
Subject: meta-openstack open-iscsi question
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
X-List-Received-Date: Tue, 29 Jul 2014 12:44:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hello guys,=20

I am curious on why do you have in meta-cloud-services duplicated recipes:
	open-iscsi-user  	- 	iscsi-initiator-utils
	open-iscsi-kernel 	-  	kernel with open iscsi modules enabled and built.

I can see that the sources available for open-iscsi-kernel are applicable f=
or kernel version < 3,
But I do not understand the uses of both open-iscsi-user and iscsi-initiato=
r-utils because they are building the same information but different versio=
n of the sources.
At least so it seems.


Thanks,
Alexandru Vaduva
=A0





