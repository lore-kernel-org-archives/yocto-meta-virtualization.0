Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web09.12064.1638542208751188636
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 06:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=bMDr1wZd;
 spf=pass (domain: phytec.de, ip: 195.145.39.210, mailfrom: s.mueller-klieser@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1638542206; x=1641134206;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oFivdj6XWfGGL5JfsPQTyzHjKR8flWMFuqUCYno/Rnk=;
	b=bMDr1wZdRhtLzHQyUSR2GdnNwf1MNBTTRxJl7v1ppY9RMIH09vIGi5O4xmSBsFfH
	kEwd+1VXjt8EVYEs2O4J08K9GSZWh4szpnR4JfPwjB4QDJ+eLDnvEXoaS5/a0j6G
	QkZ7w6fou7bWAjbHbXg3iyycgnWomkYOQYtApBvfuAE=;
X-AuditID: c39127d2-4f7337000000426a-47-61aa2b7e7a53
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id B0.CB.17002.E7B2AA16; Fri,  3 Dec 2021 15:36:46 +0100 (CET)
Received: from [172.16.21.131] (172.16.0.116) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 3 Dec
 2021 15:36:46 +0100
Message-ID: <9a41f678-a9b9-4540-9ff1-08144cdf2221@phytec.de>
Date: Fri, 3 Dec 2021 15:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [meta-virtualization][hardknott][PATCH] oci-runtime-spec: fix url
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
References: <20211203130427.8027-1-s.mueller-klieser@phytec.de>
 <CADkTA4OWD+Goy7XBZUFaW60fnD-wpFjaBVKLKc1t978g9u+mSw@mail.gmail.com>
From: "Stefan Mueller-Klieser" <S.Mueller-Klieser@phytec.de>
In-Reply-To: <CADkTA4OWD+Goy7XBZUFaW60fnD-wpFjaBVKLKc1t978g9u+mSw@mail.gmail.com>
Return-Path: s.mueller-klieser@phytec.de
X-Originating-IP: [172.16.0.116]
X-ClientProxiedBy: Berlix.phytec.de (172.16.0.117) To Berlix.phytec.de
 (172.16.0.117)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWyRoChVLdOe1Wiwd8LmhbdOw+wWiz68ozV
	gclj56y77B4zTz1iDmCK4rJJSc3JLEst0rdL4Mp4caKPvaBBouL18W2sDYwbRboYOTkkBEwk
	znWuZQaxhQSWMUms2iAEYT9glFi3XBLE5hWwkWg/+ZEJxGYRUJF4vvcVG0RcUOLkzCcsILao
	QITE25YVrCC2sICfxLW358FsZgFxiVtP5oP1igjoSkx/t48ZIm4g8ez/NqAaLqBdbYwS+9ec
	AxvKJuAlcW97I1gDp0CgxNqOx0wQDRYSi98cZIew5SWat84GGsQB1KwhcXx5CcQvChJzf09k
	hrDDJd6e+s08gVF4FpJTZyE5aRaSqbOQTF3AyLKKUSg3Mzk7tSgzW68go7IkNVkvJXUTIzDc
	D09Uv7SDsW+OxyFGJg7GQ4wSHMxKIrzyM5clCvGmJFZWpRblxxeV5qQWH2KU5mBREue938OU
	KCSQnliSmp2aWpBaBJNl4uCUamCccUf01DuZi4Xax/NKm/YbWqw21leYm+4xe2VLWbzdkbY/
	l2csLT7fee/st7Ot3Ks+PGcQjzXNZ5jAvTE3yX/f8glmUt/t7942ysveYdfOWL/+8Sud+Zbs
	Kz1jIx4sPcgyofbzIdkfD84yvvcMutDCGLF4bqv6j8IKSbnNwvualji2ij/W6u9WYinOSDTU
	Yi4qTgQAI4o4omUCAAA=
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.21 15:07, Bruce Ashfield wrote:
> Since we already have these changes in master, this is fundamentally a
> cherrypick / backport request.

true, I did not follow, sorry

>
> There are a couple of larger/group patches for the protocol and branch
> changes, but there's an individual one for the switch to main.
>
> I cherry-picked and modified everything, and pushed it to
> hardknott-next .. have a look and let me know if anything needs
> adjustment.

I just put hardknott-next in the build and it looks good. That is all I
needed. Thanks a lot for the quick reply and the quick fix! Have a good
weekend!

Cheers, Stefan

>
> Bruce
>
> On Fri, Dec 3, 2021 at 8:04 AM Stefan Mueller-Klieser
> <S.Mueller-Klieser@phytec.de> wrote:
>>
>> Upstream renamed master to main and github will remove the git protocol.
>>
>> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
>> ---
>>   recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb=
 b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
>> index c4083c09d818..99f309772310 100644
>> --- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
>> +++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=
=3Db355a61a394a504dacde901c9
>>   SRCNAME =3D "runtime-spec"
>>
>>   PKG_NAME =3D "github.com/opencontainers/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME}"
>> +SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps;dests=
uffix=3Dgit/src/${PKG_NAME}"
>>
>>   SRCREV =3D "78ab98c0761136f84e6e21b24b4dcd0be68ab782"
>>   PV =3D "v1.0.1+git${SRCPV}"
>> --
>> 2.20.1
>>
>>
>>=20
>>
>
>

--
Dipl.-Phys. Stefan M=C3=BCller-Klieser
-Gruppenleiter Software-
Tel.: +49 (0)6131 9221-0
s.mueller-klieser@phytec.de
www.phytec.de

Sie finden uns auch auf: Facebook, LinkedIn, Xing, YouTube

PHYTEC Messtechnik GmbH | Robert-Koch-Str. 39 | 55129 Mainz, Germany
Gesch=C3=A4ftsf=C3=BChrer: Dipl.-Ing. Michael Mitezki, Dipl.-Ing. Bodo Hube=
r |
Handelsregister Mainz HRB 4656 | Finanzamt Mainz| St.Nr. 266500608, DE
149059855
This E-Mail may contain confidential or privileged information. If you
are not the intended recipient (or have received this E-Mail in error)
please notify the sender immediately and destroy this E-Mail. Any
unauthorized copying, disclosure or distribution of the material in
this E-Mail is strictly forbidden.
