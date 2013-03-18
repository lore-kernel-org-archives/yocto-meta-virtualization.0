Return-Path: <r63875@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe005.messaging.microsoft.com [213.199.154.208])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37D7FE0129D
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Mar 2013 19:49:50 -0700 (PDT)
Received: from mail1-am1-R.bigfish.com (10.3.201.235) by
	AM1EHSOBE010.bigfish.com (10.3.204.30) with Microsoft SMTP Server id
	14.1.225.23; Mon, 18 Mar 2013 02:49:48 +0000
Received: from mail1-am1 (localhost [127.0.0.1])	by mail1-am1-R.bigfish.com
	(Postfix) with ESMTP id 641422000A5;
	Mon, 18 Mar 2013 02:49:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I542I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz177df4h17326ah8275dh8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail1-am1 (localhost.localdomain [127.0.0.1]) by mail1-am1
	(MessageSwitch) id 1363574985844589_31447;
	Mon, 18 Mar 2013 02:49:45 +0000 (UTC)
Received: from AM1EHSMHS006.bigfish.com (unknown [10.3.201.230])	by
	mail1-am1.bigfish.com (Postfix) with ESMTP id C292F3E00D5;
	Mon, 18 Mar 2013 02:49:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS006.bigfish.com
	(10.3.207.106) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 18 Mar 2013 02:49:45 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.62]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0328.011; Mon, 18 Mar 2013 02:49:44 +0000
From: Yin Olivia-R63875 <r63875@freescale.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] libvirt: upgrade to 1.0.3
Thread-Index: AQHOH7A9Edb26I6f0Euj0wTFqtDH3JijmRwAgAM9LwCAA+WywA==
Date: Mon, 18 Mar 2013 02:49:43 +0000
Message-ID: <B5012D5F6E2BBC4DBF16B3E6037A5B732EB3B5@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1363152493-25261-1-git-send-email-hong-hua.yin@freescale.com>
	<CADkTA4N1wugSgFowPCCyjtcMVeGSrVOHO+CqUwO8KuuKutZ2nw@mail.gmail.com>
	<CADkTA4NSqeasAR7Q4nK_4pVp1uYfF67=zCSZVLJFQECzCn48xA@mail.gmail.com>
In-Reply-To: <CADkTA4NSqeasAR7Q4nK_4pVp1uYfF67=zCSZVLJFQECzCn48xA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.193.20.75]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: upgrade to 1.0.3
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
X-List-Received-Date: Mon, 18 Mar 2013 02:49:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I can't find any example tests you required.

I just ran on FSL PowerPC platforms with QEMU/LXC cases and most domain fun=
ctions worked well.


Best Regards,
Olivia



-----Original Message-----
From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]=20
Sent: Friday, March 15, 2013 10:39 PM
To: Yin Olivia-R63875
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] libvirt: upgrade to 1.0.3

On Wed, Mar 13, 2013 at 6:11 AM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
> On Wed, Mar 13, 2013 at 12:28 AM, Olivia Yin <hong-hua.yin@freescale.com>=
 wrote:
>> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
>
> Can you quickly summarize what testing was done with libvirt ? Just so=20
> we can get a feel for the arches that have been covered, and what=20
> functionality has been exercised.
>
> Since this patch removes the 1.0 version, we won't have a fallback in=20
> tree if things break.

ping. There are a few outstanding questions on this. No rush, but I didn't =
want anyone to think we were ignoring or had dropped this series.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
>> ---
>>  .../libvirt/{libvirt_1.0.0.bb =3D> libvirt_1.0.3.bb} |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)  rename=20
>> recipes-extended/libvirt/{libvirt_1.0.0.bb =3D> libvirt_1.0.3.bb} (97%)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb=20
>> b/recipes-extended/libvirt/libvirt_1.0.3.bb
>> similarity index 97%
>> rename from recipes-extended/libvirt/libvirt_1.0.0.bb
>> rename to recipes-extended/libvirt/libvirt_1.0.3.bb
>> index 90d7dbb..372e874 100644
>> --- a/recipes-extended/libvirt/libvirt_1.0.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
>> @@ -22,8 +22,8 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.=
tar.gz \
>>         file://libvirtd.sh \
>>         file://libvirtd.conf"
>>
>> -SRC_URI[md5sum] =3D "7c8b006de7338e30866bb56738803b21"
>> -SRC_URI[sha256sum] =3D "14c8a30ebfb939c82cab5f759a95d09646b43b4210e4549=
0e92459ae65123076"
>> +SRC_URI[md5sum] =3D "3d9f85d586c9aa3d819b626622f3fc97"
>> +SRC_URI[sha256sum] =3D "f64f4acd7cdcfc6ab5e803195ed58b949f262b54e3659d8=
c37b33f0fec112757"
>>
>>  inherit autotools gettext update-rc.d
>>
>> --
>> 1.6.4
>>
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end"



--
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"



