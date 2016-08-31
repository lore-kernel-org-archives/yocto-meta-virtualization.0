Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE47DE00AB6; Wed, 31 Aug 2016 14:37:14 -0700 (PDT)
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
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.0 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 598BCE00A7F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 14:37:09 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id j37so2205689qta.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G+qGDPxNP58xGg4/pcEq7Mf5lq8d/O1MG/W0+4IasRg=;
	b=I2WXf6A8Hr0iKqK5dgUi2cGxS7nyUn4RFmOWxO0UjV+TKTovu6QSFuy3hrBY6PLtpA
	xAv3b8aaa8fKPysvJXE5HeHqO/cm7CA1gVjHxsCKLGdvJssfdhqjAAm/AehlryPjki0c
	HJAod2Oz+TeeFk8rO1O/UGTMZEYcrhHehUBhZZJYLPG7Hqba6fOmjwQNo4iLzA2OiZ5+
	KVtA5KSMIBDpWOMLAOPcpXTdrXJz4vEP3xQuSx6mccvQF/L352JC+ynAtXBKmA6cj8Me
	TWJM7OeBLD6QMAPuyhSSd7vNLHvky5u3TKkwcCUYEfFLFT9cscpwQCASYTWKRdrUczOq
	6sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G+qGDPxNP58xGg4/pcEq7Mf5lq8d/O1MG/W0+4IasRg=;
	b=h7/4Oa78UvXPBNK1hiFbvc6LFj3AC3XA3uHlVb5RDrflvAuJZU2sJMIR59PbTbv3P3
	86sOrX50sa1yxTFI74b5OH8ZIHh09ncwVz1P0jSxWnM8GNNioeRuNwpkP6yPTbeNXAZS
	xE75oWFoAFGSIGfJjcvQnauhYzAX2f8lkgIl9X9DDzrL/JDSM8pnQ8s6mOhfqlSoRA9d
	cC0AhKr5N3C1DZ0gl5FkeE3mzOF1Ut2yAHa9ZZnprPkvAdxBLBXhqTRzUGWp4VyaUURs
	WxFoalaICsui0QaWvCoyKJiWL+YCGi7E8iWGkdxO+aAbh0m6b0Jcj5mIAzeRViEk0QQb
	kOVw==
X-Gm-Message-State: AE9vXwPKcnKItXS2QnlgqEctee/kfEm/p5I7ikvUwomXEQTqoadAlXOFPH+RklUElUxagMUlptWcq9dfOQJ0KA==
X-Received: by 10.200.47.164 with SMTP id l33mr13739846qta.19.1472679429334;
	Wed, 31 Aug 2016 14:37:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.53.83 with HTTP; Wed, 31 Aug 2016 14:37:08 -0700 (PDT)
In-Reply-To: <2235570.MPKlLZhv0K@tal>
References: <1472667583-9767-1-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4P1D9_QqsweNfQPFWkKG4E-XwsE-GoQns9=_ipx0SD1eA@mail.gmail.com>
	<CADkTA4OXW0B-mX2nFjOHjZYiz9rao2v=WaEZW8TBWMUCD65u2Q@mail.gmail.com>
	<2235570.MPKlLZhv0K@tal>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Aug 2016 17:37:08 -0400
Message-ID: <CADkTA4OVvUAeW1LgmBm7cpy9gBVYRUvnXuP8EdH_r=EXWwO97g@mail.gmail.com>
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
X-List-Received-Date: Wed, 31 Aug 2016 21:37:14 -0000
Content-Type: multipart/alternative; boundary=001a11378e1a410b1f053b64e6f2

--001a11378e1a410b1f053b64e6f2
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 31, 2016 at 5:30 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On August 31, 2016 17:27:34 Bruce Ashfield wrote:
> > On Wed, Aug 31, 2016 at 5:17 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> >
> > wrote:
> > > On Wed, Aug 31, 2016 at 5:13 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> > >
> > > wrote:
> > >> On Wed, Aug 31, 2016 at 5:11 PM, Mark Asselstine <
> > >>
> > >> mark.asselstine@windriver.com> wrote:
> > >>> On August 31, 2016 17:09:45 Mark Asselstine wrote:
> > >>> > On August 31, 2016 16:56:38 Bruce Ashfield wrote:
> > >>> > > On 2016-08-31 2:19 PM, Mark Asselstine wrote:
> > >>> > > > Seems upstream adjusted their LICENSE file. The license is
> still
> > >>> > > > Apache version 2 so no worries about having to update the
> LICENSE
> > >>> > > > string for the recipe.
> > >>> > >
> > >>> > > Or is this using a common LIC file which changed ? My oe-core is
> > >>> > > about two weeks out of date.
> > >>> >
> > >>> > Has nothing to do with the SRC_URI, it is a changed md5sum on the
> > >>>
> > >>> fetched
> > >>>
> > >>> > content, in this case the file named LICENSE.
> > >>>
> > >>> OH, I see why you tied it back to the git hash. That just means that
> > >>> this
> > >>> mismatch has existed since that hash was changed. Again, just masked
> by
> > >>> the
> > >>> manipulation of ERROR_QA.
> > >>
> > >> Nope. Shouldn't be that.
> > >>
> > >> I just did a cleanall and re-build. The checksum matches.
> > >
> > > ... and I just realized that cleanall doesn't get sstate, so I'd better
> > > remove that as well!
> >
> > Sure enough, it was sstate that was the difference, skipped tasks on my
> > recent build.
> >
> > I'm seeing this now.   So I'll apply this as-is.
> >
> > Shows how many people are tracking meta-virt master :D
>
> and building docker.
>
> Glad you were able to see it, had me scratching my head earlier today as
> well
> since it wasn't touched in so long and my meta-overc build was not seeing
> it.
>

Yep. and I have an even newer docker here that was masking the error and
causing
my sstate pain.

either way. mystery solved.

Bruce


>
> Mark
>
> >
> > Bruce
> >
> > > Bruce
> > >
> > >> Bruce
> > >>
> > >>> Mark
> > >>>
> > >>> > You are not seeing the issue because I am guessing you are building
> > >>>
> > >>> with
> > >>>
> > >>> > meta- overc, which we restrict the ERROR_QA and thus don't include
> > >>> > 'license- checksum'. Add 'license-checksum' to ERROR_QA in
> local.conf
> > >>>
> > >>> or
> > >>>
> > >>> > meta- overc/conf/distro/overc.conf and you will see this.
> > >>> >
> > >>> > Mark
> > >>> >
> > >>> > > Bruce
> > >>> > >
> > >>> > > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > >>> > > > ---
> > >>> > > >
> > >>> > > >  recipes-containers/docker/docker_git.bb | 2 +-
> > >>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>> > > >
> > >>> > > > diff --git a/recipes-containers/docker/docker_git.bb
> > >>> > > > b/recipes-containers/docker/docker_git.bb index
> 4f85193..4be5e47
> > >>>
> > >>> 100644
> > >>>
> > >>> > > > --- a/recipes-containers/docker/docker_git.bb
> > >>> > > > +++ b/recipes-containers/docker/docker_git.bb
> > >>> > > > @@ -28,7 +28,7 @@ SRC_URI = "\
> > >>> > > >
> > >>> > > >  # Apache-2.0 for docker
> > >>> > > >  LICENSE = "Apache-2.0"
> > >>> > > >
> > >>> > > > -LIC_FILES_CHKSUM =
> > >>> > > > "file://LICENSE;md5=cc2221abf0b96ea39dd68141b70f7937"
> > >>> > > > +LIC_FILES_CHKSUM =
> > >>> > > > "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
> > >>> > > >
> > >>> > > >  S = "${WORKDIR}/git"
> > >>>
> > >>> --
> > >>> _______________________________________________
> > >>> meta-virtualization mailing list
> > >>> meta-virtualization@yoctoproject.org
> > >>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> > >>
> > >> --
> > >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee
> > >> at its end"
> > >
> > > --
> > > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee
> > > at its end"
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11378e1a410b1f053b64e6f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 31, 2016 at 5:30 PM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div class=3D"HOEnZb"><div class=3D"h5">On August 31, 2016 17:27:34 Bruc=
e Ashfield wrote:<br>
&gt; On Wed, Aug 31, 2016 at 5:17 PM, Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Wed, Aug 31, 2016 at 5:13 PM, Bruce Ashfield &lt;<a href=3D"ma=
ilto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;&gt; On Wed, Aug 31, 2016 at 5:11 PM, Mark Asselstine &lt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <a href=3D"mailto:mark.asselstine@windriver.com">mark.asselst=
ine@windriver.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; On August 31, 2016 17:09:45 Mark Asselstine wrote:<br>
&gt; &gt;&gt;&gt; &gt; On August 31, 2016 16:56:38 Bruce Ashfield wrote:<br=
>
&gt; &gt;&gt;&gt; &gt; &gt; On 2016-08-31 2:19 PM, Mark Asselstine wrote:<b=
r>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; Seems upstream adjusted their LICENSE file=
. The license is still<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; Apache version 2 so no worries about havin=
g to update the LICENSE<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; string for the recipe.<br>
&gt; &gt;&gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; Or is this using a common LIC file which change=
d ? My oe-core is<br>
&gt; &gt;&gt;&gt; &gt; &gt; about two weeks out of date.<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; Has nothing to do with the SRC_URI, it is a changed =
md5sum on the<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; fetched<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &gt; content, in this case the file named LICENSE.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; OH, I see why you tied it back to the git hash. That just=
 means that<br>
&gt; &gt;&gt;&gt; this<br>
&gt; &gt;&gt;&gt; mismatch has existed since that hash was changed. Again, =
just masked by<br>
&gt; &gt;&gt;&gt; the<br>
&gt; &gt;&gt;&gt; manipulation of ERROR_QA.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Nope. Shouldn&#39;t be that.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I just did a cleanall and re-build. The checksum matches.<br>
&gt; &gt;<br>
&gt; &gt; ... and I just realized that cleanall doesn&#39;t get sstate, so =
I&#39;d better<br>
&gt; &gt; remove that as well!<br>
&gt;<br>
&gt; Sure enough, it was sstate that was the difference, skipped tasks on m=
y<br>
&gt; recent build.<br>
&gt;<br>
&gt; I&#39;m seeing this now.=C2=A0 =C2=A0So I&#39;ll apply this as-is.<br>
&gt;<br>
&gt; Shows how many people are tracking meta-virt master :D<br>
<br>
</div></div>and building docker.<br>
<br>
Glad you were able to see it, had me scratching my head earlier today as we=
ll<br>
since it wasn&#39;t touched in so long and my meta-overc build was not seei=
ng it.<br></blockquote><div><br></div><div>Yep. and I have an even newer do=
cker here that was masking the error and causing</div><div>my sstate pain.<=
/div><div><br></div><div>either way. mystery solved.</div><div><br></div><d=
iv>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt; Bruce<br>
&gt; &gt;<br>
&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Mark<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &gt; You are not seeing the issue because I am guessing y=
ou are building<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; with<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &gt; meta- overc, which we restrict the ERROR_QA and thus=
 don&#39;t include<br>
&gt; &gt;&gt;&gt; &gt; &#39;license- checksum&#39;. Add &#39;license-checks=
um&#39; to ERROR_QA in local.conf<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; or<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &gt; meta- overc/conf/distro/overc.conf and you will see =
this.<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; Mark<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; Bruce<br>
&gt; &gt;&gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; Signed-off-by: Mark Asselstine &lt;<a href=
=3D"mailto:mark.asselstine@windriver.com">mark.asselstine@windriver.com</a>=
<wbr>&gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; ---<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;=C2=A0 recipes-containers/docker/<a href=3D=
"http://docker_git.bb" rel=3D"noreferrer" target=3D"_blank">dock<wbr>er_git=
.bb</a> | 2 +-<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 de=
letion(-)<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; diff --git a/recipes-containers/docker/<a =
href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_blank">do<wbr>c=
ker_git.bb</a><br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; b/recipes-containers/docker/<a href=3D"htt=
p://docker_git.bb" rel=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb<=
/a> index 4f85193..4be5e47<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; 100644<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; --- a/recipes-containers/docker/<a href=3D=
"http://docker_git.bb" rel=3D"noreferrer" target=3D"_blank">do<wbr>cker_git=
.bb</a><br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; +++ b/recipes-containers/docker/<a href=3D=
"http://docker_git.bb" rel=3D"noreferrer" target=3D"_blank">do<wbr>cker_git=
.bb</a><br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; @@ -28,7 +28,7 @@ SRC_URI =3D &quot;\<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;=C2=A0 # Apache-2.0 for docker<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<b=
r>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; &quot;file://LICENSE;md5=3D<wbr>cc2221abf0=
b96ea39dd68141b70f79<wbr>37&quot;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt; &quot;file://LICENSE;md5=3D<wbr>aadc30f9c1=
4d876ded7bedc0afd2d3<wbr>d7&quot;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; &gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; ______________________________<wbr>_________________<br>
&gt; &gt;&gt;&gt; meta-virtualization mailing list<br>
&gt; &gt;&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">m=
eta-virtualization@<wbr>yoctoproject.org</a><br>
&gt; &gt;&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-v=
irtualization" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.<wbr>org/listinfo/meta-<wbr>virtualization</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and m=
adness await thee<br>
&gt; &gt;&gt; at its end&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madne=
ss await thee<br>
&gt; &gt; at its end&quot;<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a11378e1a410b1f053b64e6f2--
