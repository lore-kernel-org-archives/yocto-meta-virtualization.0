Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A10EAE00A08; Wed, 31 Aug 2016 14:17:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.0 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 386EDE009EF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 14:17:01 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id o1so4397631qkd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3DFLdaaK3L5sQy0YY6YAXfU6FgP+yVjCKmHLQ+mQmbM=;
	b=RuXda7h3xBqg4ls2CyjzYQAWQtuvBwxHydLIf618hQXGtRAtaGj9SqhudEZvt0xnQp
	+Albs7HFzkBIyim5wFkdWyAcOF9EUcOrzL4MXKdnEKBJqqktGX6hJNMdeDseFle8D8th
	j6S2tRvj0URq03XWF+N8tT0xOXCUiPhI/mQiHCVRcuRFwfk2P1Afw43lL4m0uVpEBdRC
	N6yCtDkrtFIlVNyb8BAxHHzL60sjAl+9JehLrrXaqjO/gAA/mF3xakDDLg7/Ydz4SivC
	nO3NZ9Zspyv6QunnLHWT/oXTDo77nx/R3kboMHagpB5mAgkJzLP6sfHmmgo1aekIhSe2
	A/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3DFLdaaK3L5sQy0YY6YAXfU6FgP+yVjCKmHLQ+mQmbM=;
	b=DO/LWrdhlQQEZUzxHAVDM1V5DuaM7ZJwagnsrNqDYFDgyAuWAmDbsQ3ok9lrOMJYQ9
	DBJoctPN9z5FbhgzdO/ruG4s96ULbhVTAKXMa9PiHG9awFZF+54jkITC5TeO6fOLuBdl
	38msjU8VYBsQyNaigVJwGxvuKo65wvBiwRYEbb1YlLC2JSNeoHEZdL+s/uzE6Ce5wdOv
	gcKvfb1V0lpphQhmDHQUvjO3tnavnwcAle1Dsd/6hHKV51WQsje3fsexGafK1bSsWx2U
	+m74tsBW56R1IbE4T4H/6P2YWcBgj+0kC3MIzEDkkNysABRZPkdfBHW9pBvszP8wBMHQ
	y4Rg==
X-Gm-Message-State: AE9vXwPKjdQBgarfrbCJ5sk3XQuN1+ZM1ifUA7TicUM84CgHqDoOKEYWB81JHt5b8u/+Jgt/wJb9GwKhePGtPw==
X-Received: by 10.55.209.140 with SMTP id o12mr12736594qkl.286.1472678221420; 
	Wed, 31 Aug 2016 14:17:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.53.83 with HTTP; Wed, 31 Aug 2016 14:17:00 -0700 (PDT)
In-Reply-To: <CADkTA4NhdqBgHBaSrGrYV-hKH15P8ro6g74GGu=DrEBcSMQWzw@mail.gmail.com>
References: <1472667583-9767-1-git-send-email-mark.asselstine@windriver.com>
	<e3ddf5db-afef-7dde-f8d8-42c6c4958a12@windriver.com>
	<3047881.Lfg8Ytdqov@tal> <5574955.TienvFM2l3@tal>
	<CADkTA4NhdqBgHBaSrGrYV-hKH15P8ro6g74GGu=DrEBcSMQWzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Aug 2016 17:17:00 -0400
Message-ID: <CADkTA4P1D9_QqsweNfQPFWkKG4E-XwsE-GoQns9=_ipx0SD1eA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] docker: update license md5sum
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
X-List-Received-Date: Wed, 31 Aug 2016 21:17:03 -0000
Content-Type: multipart/alternative; boundary=001a1147a29e41c45b053b649ec5

--001a1147a29e41c45b053b649ec5
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 31, 2016 at 5:13 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Wed, Aug 31, 2016 at 5:11 PM, Mark Asselstine <
> mark.asselstine@windriver.com> wrote:
>
>> On August 31, 2016 17:09:45 Mark Asselstine wrote:
>> > On August 31, 2016 16:56:38 Bruce Ashfield wrote:
>> > > On 2016-08-31 2:19 PM, Mark Asselstine wrote:
>> > > > Seems upstream adjusted their LICENSE file. The license is still
>> > > > Apache version 2 so no worries about having to update the LICENSE
>> > > > string for the recipe.
>> > >
>> > > Or is this using a common LIC file which changed ? My oe-core is
>> > > about two weeks out of date.
>> >
>> > Has nothing to do with the SRC_URI, it is a changed md5sum on the
>> fetched
>> > content, in this case the file named LICENSE.
>>
>> OH, I see why you tied it back to the git hash. That just means that this
>> mismatch has existed since that hash was changed. Again, just masked by
>> the
>> manipulation of ERROR_QA.
>>
>
> Nope. Shouldn't be that.
>
> I just did a cleanall and re-build. The checksum matches.
>

... and I just realized that cleanall doesn't get sstate, so I'd better
remove that as well!

Bruce


>
> Bruce
>
>
>>
>> Mark
>>
>> >
>> > You are not seeing the issue because I am guessing you are building with
>> > meta- overc, which we restrict the ERROR_QA and thus don't include
>> > 'license- checksum'. Add 'license-checksum' to ERROR_QA in local.conf or
>> > meta- overc/conf/distro/overc.conf and you will see this.
>> >
>> > Mark
>> >
>> > > Bruce
>> > >
>> > > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> > > > ---
>> > > >
>> > > >  recipes-containers/docker/docker_git.bb | 2 +-
>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/recipes-containers/docker/docker_git.bb
>> > > > b/recipes-containers/docker/docker_git.bb index 4f85193..4be5e47
>> 100644
>> > > > --- a/recipes-containers/docker/docker_git.bb
>> > > > +++ b/recipes-containers/docker/docker_git.bb
>> > > > @@ -28,7 +28,7 @@ SRC_URI = "\
>> > > >
>> > > >  # Apache-2.0 for docker
>> > > >  LICENSE = "Apache-2.0"
>> > > >
>> > > > -LIC_FILES_CHKSUM =
>> > > > "file://LICENSE;md5=cc2221abf0b96ea39dd68141b70f7937"
>> > > > +LIC_FILES_CHKSUM =
>> > > > "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
>> > > >
>> > > >  S = "${WORKDIR}/git"
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1147a29e41c45b053b649ec5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 31, 2016 at 5:13 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n class=3D"">On Wed, Aug 31, 2016 at 5:11 PM, Mark Asselstine <span dir=3D"=
ltr">&lt;<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank"=
>mark.asselstine@windriver.com</a><wbr>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><span>On August 31, 2016 17:09:45 Mark Asselstine wrote:<b=
r>
&gt; On August 31, 2016 16:56:38 Bruce Ashfield wrote:<br>
&gt; &gt; On 2016-08-31 2:19 PM, Mark Asselstine wrote:<br>
&gt; &gt; &gt; Seems upstream adjusted their LICENSE file. The license is s=
till<br>
&gt; &gt; &gt; Apache version 2 so no worries about having to update the LI=
CENSE<br>
&gt; &gt; &gt; string for the recipe.<br>
&gt; &gt;<br>
&gt; &gt; Or is this using a common LIC file which changed ? My oe-core is<=
br>
&gt; &gt; about two weeks out of date.<br>
&gt;<br>
&gt; Has nothing to do with the SRC_URI, it is a changed md5sum on the fetc=
hed<br>
&gt; content, in this case the file named LICENSE.<br>
<br>
</span>OH, I see why you tied it back to the git hash. That just means that=
 this<br>
mismatch has existed since that hash was changed. Again, just masked by the=
<br>
manipulation of ERROR_QA.<br></blockquote><div><br></div></span><div>Nope. =
Shouldn&#39;t be that.=C2=A0</div><div><br></div><div>I just did a cleanall=
 and re-build. The checksum matches.</div></div></div></div></blockquote><d=
iv><br></div><div>... and I just realized that cleanall doesn&#39;t get sst=
ate, so I&#39;d better remove that as well!</div><div><br></div><div>Bruce<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div><br></div><div>Bruce<=
/div><div><div class=3D"h5"><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<span><font color=3D"#888888"><br>
Mark<br>
</font></span><div><div><br>
&gt;<br>
&gt; You are not seeing the issue because I am guessing you are building wi=
th<br>
&gt; meta- overc, which we restrict the ERROR_QA and thus don&#39;t include=
<br>
&gt; &#39;license- checksum&#39;. Add &#39;license-checksum&#39; to ERROR_Q=
A in local.conf or<br>
&gt; meta- overc/conf/distro/overc.conf and you will see this.<br>
&gt;<br>
&gt; Mark<br>
&gt;<br>
&gt; &gt; Bruce<br>
&gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.as=
selstine@windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>=
<wbr>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 recipes-containers/docker/<a href=3D"http://docker_git=
.bb" rel=3D"noreferrer" target=3D"_blank">dock<wbr>er_git.bb</a> | 2 +-<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/recipes-containers/docker/<a href=3D"http://doc=
ker_git.bb" rel=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
&gt; &gt; &gt; b/recipes-containers/docker/<a href=3D"http://docker_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> index 4f85193.=
.4be5e47 100644<br>
&gt; &gt; &gt; --- a/recipes-containers/docker/<a href=3D"http://docker_git=
.bb" rel=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
&gt; &gt; &gt; +++ b/recipes-containers/docker/<a href=3D"http://docker_git=
.bb" rel=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
&gt; &gt; &gt; @@ -28,7 +28,7 @@ SRC_URI =3D &quot;\<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 # Apache-2.0 for docker<br>
&gt; &gt; &gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &quot;file://LICENSE;md5=3Dcc2221abf0<wbr>b96ea39dd68141b70f=
7937&quot;<br>
&gt; &gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &quot;file://LICENSE;md5=3Daadc30f9c1<wbr>4d876ded7bedc0afd2=
d3d7&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
</div></div></blockquote></div></div></div><span class=3D"HOEnZb"><font col=
or=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div data-smartm=
ail=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a1147a29e41c45b053b649ec5--
