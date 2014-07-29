Return-Path: <Alexandru.Vaduva@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CE91E007EA; Tue, 29 Jul 2014 05:52:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id E6433E007E4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jul 2014 05:51:56 -0700 (PDT)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Tue, 29 Jul 2014 14:51:55 +0200
From: Alexandru Vaduva <Alexandru.Vaduva@enea.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: meta-openstack open-iscsi question
Thread-Index: AQHPqyuyx0ddUPchS0KF3gzUpKIe7Ju3AUNA
Date: Tue, 29 Jul 2014 12:51:55 +0000
Message-ID: <DDB0C57E45663A458C5CACB7B5688BC21D6D56B6@SESTOEX04.enea.se>
References: <DDB0C57E45663A458C5CACB7B5688BC21D6D568D@SESTOEX04.enea.se>
	<53D79893.3090705@windriver.com>
In-Reply-To: <53D79893.3090705@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.184]
MIME-Version: 1.0
Cc: "vu.tran@windriver.com" <vu.tran@windriver.com>
Subject: Re: meta-openstack open-iscsi question
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
X-List-Received-Date: Tue, 29 Jul 2014 12:52:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

So you no longer use the open-iscsi-user  and open-iscsi-kernel recipes?

-----Original Message-----
From: Bruce Ashfield [mailto:bruce.ashfield@windriver.com]=20
Sent: Tuesday, July 29, 2014 3:50 PM
To: Alexandru Vaduva; meta-virtualization@yoctoproject.org
Cc: vu.tran@windriver.com
Subject: Re: meta-openstack open-iscsi question

On 14-07-29 08:44 AM, Alexandru Vaduva wrote:
> Hello guys,
>
> I am curious on why do you have in meta-cloud-services duplicated recipes=
:
> 	open-iscsi-user  	- 	iscsi-initiator-utils

We have modifications to this recipe that I'm working to get into the origi=
nal over time.

But I can't hold merging dependent recipes while I wait, so I carry the cha=
nges in meta-cloud-services while that process happens.

> 	open-iscsi-kernel 	-  	kernel with open iscsi modules enabled and built.
>
> I can see that the sources available for open-iscsi-kernel are=20
> applicable for kernel version < 3,

The kernel part is only there for completeness sake. We build the kernel pa=
rts from the linux-yocto recipes. Over time, we'll also be dropping this pa=
rt .. as Vu knows, I already asked him and am in the process of removing it=
.

> But I do not understand the uses of both open-iscsi-user and iscsi-initia=
tor-utils because they are building the same information but different vers=
ion of the sources.
> At least so it seems.

Again. For completeness sake. We brought in a complete copy of the HIPOS re=
cipes to work with as part of enabling the backend. That way I can more eas=
ily keep it in sync.

Bruce

>
>
> Thanks,
> Alexandru Vaduva
>
>
>
>
>


