Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E08AE00480; Wed, 18 Jan 2017 07:06:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 436A8E0030B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jan 2017 07:06:39 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id u68so1207642ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jan 2017 07:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OUItpmPjYkIy+6Ro8f+VYnqHmRrNwb8Ij5ttwtaepcY=;
	b=bEpxNNxoyFwsC/lz6Qbq4M+NogvPVHOz24Qb5inRSRZaMvme6Uq+QSFlGlVEJXgW99
	8Zf9DKlC7BeM7P4VmbqmR+4889nb9ebtU95vvI/EqquBUhmCWofywRfMp2jSaNQutR6x
	6HbeXmABNTgC6iq04Loq9nk7dPTHZZnuE7ntI1P5hgpEaTCZi+Ccz6Fx5Wj+gkBMHs93
	/EJu1v35X97jzNlrtpJH1MZpr5MqJJ2/4Kvs2Wsy1dJMU7NYLDpEyPe+1tZ4nQyh1MiX
	5WUNJuqqhGqmXcj8F/hPpmUGYq0P0b3JbbXwT0Ag68pg60JbSeNFD8Otopyhv+K1k5yt
	uarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=OUItpmPjYkIy+6Ro8f+VYnqHmRrNwb8Ij5ttwtaepcY=;
	b=mnRj1VS7GCG953U6en7+0aKuOX6kQzXgLIzm5jaVf0GQrvNXdAc4ncs451QpBcGzxt
	TRO7YTo9d9S+AxffR+3oNdOm4o+T7JwOHjKf22DvacD0fBEEGfn7/cBf4usMv0jFEwvo
	S1F/b58qErH/SwxFNFpvO1HAufMu9Rpfw4ZIG7YcdGvFm1FSNtKXgavI/ThYRdOyfDbv
	xFMOISbtf5iwm84CN3d6ZQNHgCdhFAGRnbIuK9NcaxR/kq2s9OmWkgZVXHAr7ETynw27
	p43d8uAzAcu6lTgrTsnzNt6q+t5SeKCft7emS2KSS0XfSUBxDazNRQfPjRxTnuQKIOYZ
	RLYQ==
X-Gm-Message-State: AIkVDXJ1vr3KZXyeo3Ju8SJXzOMR4m5x905/xgdtGFKPhcsgIHG4lrg5NYHJEPbR0B81g/KwFOm8VsacXzL5eg==
X-Received: by 10.13.210.196 with SMTP id u187mr3077518ywd.48.1484751999025;
	Wed, 18 Jan 2017 07:06:39 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Wed, 18 Jan 2017 07:06:38 -0800 (PST)
In-Reply-To: <97F7C8E70D26E94FA7E05578493F65C6DE7B6C@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1484531499-24440-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CADkTA4PSg5kfWJgjYfk5reLfGXgUDuoxuijHZq8SQc0bYCivcA@mail.gmail.com>
	<CAPuovELe3f-6Co=cz54oniX2i4+E_DbTHhhD=z_Knc2TXbQXHw@mail.gmail.com>
	<97F7C8E70D26E94FA7E05578493F65C6DE7B6C@G08CNEXMBPEKD03.g08.fujitsu.local>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 18 Jan 2017 10:06:38 -0500
X-Google-Sender-Auth: -wkQDLtinE0MoDbZzgj5EO7wOhI
Message-ID: <CAPuovEK5jjDm=5pn6Do1vXdudgQz=_Y_wyU6LAUFZCaq+ep3ag@mail.gmail.com>
To: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-sqlalchemy: 1.0.8 -> 1.0.9
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2017 15:06:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

That is fine. I have a commit prepped already for 1.0.16. I don't want
to make the jump from the 1.0.x to 1.1.x series just yet. I just
wanted to see if you had specific reasons for only going to 1.0.9,
since you have none I will progress with my RR.

Mark

On Wed, Jan 18, 2017 at 3:24 AM, Huang, Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> At that time, I did not find the updated version. The latest version of t=
he official website is 1.1.5 now. Compared with the 1.0.9 version, the down=
load address has changed. I'll send the V2 version to upgrade it to 1.1.5 v=
ersion.
>
> Thanks
> Huang
>> -----Original Message-----
>> From: asselsm@gmail.com [mailto:asselsm@gmail.com] On Behalf Of Mark
>> Asselstine
>> Sent: Wednesday, January 18, 2017 4:56 AM
>> To: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Cc: Huang, Qiyu/=E9=BB=84 =E7=90=A6=E5=AE=87 <huangqy.fnst@cn.fujitsu.co=
m>;
>> meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH] python-sqlalchemy: 1.0.8 -> 1=
.0.9
>>
>> Huang I didn't see any indication in the commit log related to why you s=
topped
>> at 1.0.9 and didn't continue to take this to 1.0.16. Is there a reason y=
ou
>> selected this version? I would like to take it to 1.0.16 to pick up the =
remaining
>> bug fixes as well as support the uprev to OpenStack Newton in
>> meta-cloud-services. python-oslo.db in stable/newton requires 1.0.10 at
>> minimum. Please let me know.
>>
>> Mark
>>
>> On Tue, Jan 17, 2017 at 2:50 PM, Bruce Ashfield <bruce.ashfield@gmail.co=
m>
>> wrote:
>> > merged.
>> >
>> > Bruce
>> >
>> > On Sun, Jan 15, 2017 at 8:51 PM, Huang Qiyu
>> > <huangqy.fnst@cn.fujitsu.com>
>> > wrote:
>> >>
>> >> Upgrade python-sqlalchemy from 1.0.8 to 1.0.9.
>> >>
>> >> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> >> ---
>> >>  .../python/{python-sqlalchemy_1.0.8.bb =3D>
>> >> python-sqlalchemy_1.0.9.bb} | 4
>> >> ++--
>> >>  1 file changed, 2 insertions(+), 2 deletions(-)  rename
>> >> recipes-devtools/python/{python-sqlalchemy_1.0.8.bb =3D>
>> >> python-sqlalchemy_1.0.9.bb} (76%)
>> >>
>> >> diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
>> >> b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
>> >> similarity index 76%
>> >> rename from recipes-devtools/python/python-sqlalchemy_1.0.8.bb
>> >> rename to recipes-devtools/python/python-sqlalchemy_1.0.9.bb
>> >> index 2d66ffd..01c94a5 100644
>> >> --- a/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
>> >> +++ b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
>> >> @@ -8,8 +8,8 @@ RDEPENDS_${PN} +=3D "python-numbers"
>> >>  SRCNAME =3D "SQLAlchemy"
>> >>  SRC_URI =3D
>> >>
>> "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.
>> tar.gz"
>> >>
>> >> -SRC_URI[md5sum] =3D "7cfd005be63945c96a78c67764ac3a85"
>> >> -SRC_URI[sha256sum] =3D
>> >>
>> "950c79c0abf9e9f99c43c627c51d40d14a946810a90c35e7cd827bfd0bffe46f"
>> >> +SRC_URI[md5sum] =3D "0e2d7442e70d02c9f6346a5bf0ec2265"
>> >> +SRC_URI[sha256sum] =3D
>> >>
>> "c3d37501e36ec5d74c2d7b4a3764719db86a9cdab4a24431bf58b386743ab10e
>> "
>> >>
>> >>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>> >>
>> >> --
>> >> 2.7.4
>> >>
>> >>
>> >>
>> >> --
>> >> _______________________________________________
>> >> meta-virtualization mailing list
>> >> meta-virtualization@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end"
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >
>>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

