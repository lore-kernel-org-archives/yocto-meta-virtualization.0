Return-Path: <B43198@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe003.messaging.microsoft.com [65.55.88.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC090E01630
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Oct 2013 03:43:35 -0700 (PDT)
Received: from mail227-tx2-R.bigfish.com (10.9.14.228) by
	TX2EHSOBE013.bigfish.com (10.9.40.33) with Microsoft SMTP Server id
	14.1.225.22; Tue, 1 Oct 2013 10:43:33 +0000
Received: from mail227-tx2 (localhost [127.0.0.1])	by
	mail227-tx2-R.bigfish.com (Postfix) with ESMTP id D3CF776041E;
	Tue,  1 Oct 2013 10:43:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz9371I542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097hz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5hbe9i1155h)
Received: from mail227-tx2 (localhost.localdomain [127.0.0.1]) by mail227-tx2
	(MessageSwitch) id 13806242125946_26167;
	Tue,  1 Oct 2013 10:43:32 +0000 (UTC)
Received: from TX2EHSMHS008.bigfish.com (unknown [10.9.14.248])	by
	mail227-tx2.bigfish.com (Postfix) with ESMTP id F10AB640031;
	Tue,  1 Oct 2013 10:43:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS008.bigfish.com
	(10.9.99.108) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 1 Oct 2013 10:43:31 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.137]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.03.0158.002;
	Tue, 1 Oct 2013 10:43:31 +0000
From: Purcareata Bogdan-B43198 <B43198@freescale.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Thread-Topic: [meta-virtualization] [PATCH] libvirt: Don't fail when
	mounting securityfs with containers
Thread-Index: AQHOvcltV197tQPVVE2je65Vc7aiAZneRRUAgAACF5CAACC6gIABQUWw
Date: Tue, 1 Oct 2013 10:43:31 +0000
Message-ID: <E7E317BD5B5D764682EEAC13B01676E288C8AD@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1380537602-28880-1-git-send-email-bogdan.purcareata@freescale.com>
	<CAPuovEJkvD5ighvKZzwXWovKdUn+byMnOweZ-BjV2c10C_p=Kw@mail.gmail.com>
	<E7E317BD5B5D764682EEAC13B01676E288C5B9@039-SN2MPN1-021.039d.mgd.msft.net>
	<3714572.e2AS4sx51u@yow-masselst-d1>
In-Reply-To: <3714572.e2AS4sx51u@yow-masselst-d1>
Accept-Language: ro-RO, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.171.74.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: Don't fail when mounting securityfs with containers
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
X-List-Received-Date: Tue, 01 Oct 2013 10:43:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mark Asselstine [mailto:mark.asselstine@windriver.com]
> Sent: Monday, September 30, 2013 6:29 PM
> To: Purcareata Bogdan-B43198
> Cc: meta-virtualization@yoctoproject.org; Purcareata Bogdan-B43198
> Subject: Re: [meta-virtualization] [PATCH] libvirt: Don't fail when mount=
ing securityfs with
> containers
> =20
> I will finish my testing and submit the three upstream patches within the=
 next
> day or so. Since your patch is still being vetted upstream you might as w=
ell
> wait until it is sorted and then submit it to meta-virtualization. Knowin=
g
> that there might be upstream comments I suspect Bruce will want to wait t=
he
> few days to get a final version of your patch anyways.
>=20
> Otherwise you can bundle all 4 patches and submit them on your own. This =
works
> for me as well.
>=20
> Mark

I just noticed the feedback I've got from upstream. I will update my patch =
according to the maintainer comments, and then wait for his feedback. I wil=
l keep you updated on the progress.

Meanwhile, you may submit the three patches that are already available. Or,=
 just as well, I will bundle all 4 of them as soon as I get to a final vers=
ion for my patch.

Bogdan P.



