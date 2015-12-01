Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0ADDE00ADB; Tue,  1 Dec 2015 06:37:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 322A1E00A9B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Dec 2015 06:37:09 -0800 (PST)
Received: by vkha189 with SMTP id a189so4810601vkh.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 Dec 2015 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5ajYxn8j4uzDXik4uVcBYe4plKzvYXmKF8jox9hhMm8=;
	b=ptPh69TUNvAdSSl0EQz/5V+Ydb5+X+yL2ul8tcpBmhKMLMq1nMnmb2kYQeQ34A+MdM
	1asyiJp9tXTddnuIBaB40Y/Cp9/mVPRJN1tTK+C0Ie1JO0pw4P7wHPSKrg6mRQAbZ1oJ
	ezhdO/UWFRX0GOTMahyT9KlkltoL8xrXA9L0PK74170xS4o4FAJwwDbbTyzTnt9NjTpQ
	hDvgz0hmPtAvNWxJiji2eWAsuMe7C6OTmgTZtYDgt5Fe5i61HGk+b1AwCwtJYsM76iyX
	DGVZgKu+fBtvw5QspEebk13TXXmeVhoDEXaLfCHuLTWPiB6tdW48naAr+1A4bK/nE2lu
	18CA==
MIME-Version: 1.0
X-Received: by 10.31.48.11 with SMTP id w11mr52366334vkw.114.1448980628663;
	Tue, 01 Dec 2015 06:37:08 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 1 Dec 2015 06:37:08 -0800 (PST)
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 1 Dec 2015 09:37:08 -0500
Message-ID: <CADkTA4Of6HNYrpEBFKja8V9A-=Te86yabPHVq6fhsHO2cz4tFg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 00/13] cherry picks from master
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
X-List-Received-Date: Tue, 01 Dec 2015 14:37:12 -0000
Content-Type: multipart/alternative; boundary=001a1143e728a872ee0525d7179d

--001a1143e728a872ee0525d7179d
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 26, 2015 at 10:47 AM, Josep Puigdemont <
josep.puigdemont@enea.com> wrote:

> Hi,
> this is a collection of cherry-picks from master to fido-kilo (commit short
> hash in parantheses)
> This is part of a more complete patch set to bring fido-kilo to a more
> functional state.
>

A noble goal :) Same as we are working on for master and liberty, before
jumping to the latest.

I've merged the whole series.

Bruce


>
> Thanks!
>
> Jackie Huang (11):
>   python-glancestore: upgrade to 0.4.0 (6c67500)
>   python-amqp: upgrade to 1.4.6 (3dd57fd)
>   python-flake8: upgrade to 2.4.0 (d7a24ec)
>   python-rtslib-fb: upgrade to 2.1.51 (03fdfce)
>   python-sqlalchemy-migrate: upgrade to 0.9.6 (20b75e3)
>   python-subunit: upgrade to 1.1.0 (806fea3)
>   python-warlock: upgrade to 1.1.0 (a0c2225)
>   python-xstatic-font-awesome: upgrade to 4.3.0.0 (ea84785)
>   python-xstatic-jasmine: upgrade to 2.1.2.0 (af07c0f)
>   python-setuptools-git: upgrade to 1.1 (2ed930f)
>   python-pyscss: upgrade to 1.3.4 (87cf034)
>
> Li xin (1):
>   python-fixtures: upgrade 1.0.0 -> 1.3.1 (540c2e4)
>
> wruser (1):
>   cloud-init: fix 64bit libraries (67f97ec)
>
>  .../python/{python-amqp_1.3.2.bb => python-amqp_1.4.6.bb}        | 5
> ++---
>  .../{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb}       | 4 ++--
>  .../python/{python-flake8_2.3.0.bb => python-flake8_2.4.0.bb}    | 5
> ++---
>  meta-openstack/recipes-devtools/python/python-glancestore_git.bb | 4 ++--
>  .../python/{python-pyscss_1.2.1.bb => python-pyscss_1.3.4.bb}    | 5
> ++---
>  .../{python-rtslib-fb_2.1.32.bb => python-rtslib-fb_2.1.51.bb}   | 7
> +++----
>  ...python-setuptools-git_1.0.bb => python-setuptools-git_1.1.bb} | 9
> ++++-----
>  ...chemy-migrate_0.9.1.bb => python-sqlalchemy-migrate_0.9.6.bb} | 5
> ++---
>  .../python/{python-subunit_0.0.15.bb => python-subunit_1.1.0.bb} | 7
> +++----
>  .../python/{python-warlock_1.0.1.bb => python-warlock_1.1.0.bb}  | 5
> ++---
>  ...awesome_4.1.0.0.bb => python-xstatic-font-awesome_4.3.0.0.bb} | 7
> +++----
>  ...atic-jasmine_1.3.1.1.bb => python-xstatic-jasmine_2.1.2.0.bb} | 7
> +++----
>  meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb   | 2 +-
>  13 files changed, 31 insertions(+), 41 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-amqp_1.3.2.bb =>
> python-amqp_1.4.6.bb} (71%)
>  rename meta-openstack/recipes-devtools/python/{python-fixtures_1.0.0.bb
> => python-fixtures_1.3.1.bb} (82%)
>  rename meta-openstack/recipes-devtools/python/{python-flake8_2.3.0.bb =>
> python-flake8_2.4.0.bb} (79%)
>  rename meta-openstack/recipes-devtools/python/{python-pyscss_1.2.1.bb =>
> python-pyscss_1.3.4.bb} (78%)
>  rename meta-openstack/recipes-devtools/python/{python-rtslib-fb_2.1.32.bb
> => python-rtslib-fb_2.1.51.bb} (66%)
>  rename meta-openstack/recipes-devtools/python/{
> python-setuptools-git_1.0.bb => python-setuptools-git_1.1.bb} (68%)
>  rename meta-openstack/recipes-devtools/python/{
> python-sqlalchemy-migrate_0.9.1.bb => python-sqlalchemy-migrate_0.9.6.bb}
> (80%)
>  rename meta-openstack/recipes-devtools/python/{python-subunit_0.0.15.bb
> => python-subunit_1.1.0.bb} (61%)
>  rename meta-openstack/recipes-devtools/python/{python-warlock_1.0.1.bb
> => python-warlock_1.1.0.bb} (77%)
>  rename meta-openstack/recipes-devtools/python/{
> python-xstatic-font-awesome_4.1.0.0.bb =>
> python-xstatic-font-awesome_4.3.0.0.bb} (69%)
>  rename meta-openstack/recipes-devtools/python/{
> python-xstatic-jasmine_1.3.1.1.bb => python-xstatic-jasmine_2.1.2.0.bb}
> (67%)
>
> --
> 2.1.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143e728a872ee0525d7179d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 26, 2015 at 10:47 AM, Josep Puigdemont <span dir=3D"ltr">&l=
t;<a href=3D"mailto:josep.puigdemont@enea.com" target=3D"_blank">josep.puig=
demont@enea.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,=
<br>
this is a collection of cherry-picks from master to fido-kilo (commit short=
<br>
hash in parantheses)<br>
This is part of a more complete patch set to bring fido-kilo to a more<br>
functional state.<br></blockquote><div><br></div><div>A noble goal :) Same =
as we are working on for master and liberty, before<br></div><div>jumping t=
o the latest.<br><br></div><div>I&#39;ve merged the whole series.<br><br></=
div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks!<br>
<br>
Jackie Huang (11):<br>
=C2=A0 python-glancestore: upgrade to 0.4.0 (6c67500)<br>
=C2=A0 python-amqp: upgrade to 1.4.6 (3dd57fd)<br>
=C2=A0 python-flake8: upgrade to 2.4.0 (d7a24ec)<br>
=C2=A0 python-rtslib-fb: upgrade to 2.1.51 (03fdfce)<br>
=C2=A0 python-sqlalchemy-migrate: upgrade to 0.9.6 (20b75e3)<br>
=C2=A0 python-subunit: upgrade to 1.1.0 (806fea3)<br>
=C2=A0 python-warlock: upgrade to 1.1.0 (a0c2225)<br>
=C2=A0 python-xstatic-font-awesome: upgrade to 4.3.0.0 (ea84785)<br>
=C2=A0 python-xstatic-jasmine: upgrade to 2.1.2.0 (af07c0f)<br>
=C2=A0 python-setuptools-git: upgrade to 1.1 (2ed930f)<br>
=C2=A0 python-pyscss: upgrade to 1.3.4 (87cf034)<br>
<br>
Li xin (1):<br>
=C2=A0 python-fixtures: upgrade 1.0.0 -&gt; 1.3.1 (540c2e4)<br>
<br>
wruser (1):<br>
=C2=A0 cloud-init: fix 64bit libraries (67f97ec)<br>
<br>
=C2=A0.../python/{<a href=3D"http://python-amqp_1.3.2.bb" rel=3D"noreferrer=
" target=3D"_blank">python-amqp_1.3.2.bb</a> =3D&gt; <a href=3D"http://pyth=
on-amqp_1.4.6.bb" rel=3D"noreferrer" target=3D"_blank">python-amqp_1.4.6.bb=
</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 ++---<br>
=C2=A0.../{<a href=3D"http://python-fixtures_1.0.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-fixtures_1.0.0.bb</a> =3D&gt; <a href=3D"http://pyt=
hon-fixtures_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python-fixtures=
_1.3.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0.../python/{<a href=3D"http://python-flake8_2.3.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python-flake8_2.3.0.bb</a> =3D&gt; <a href=3D"http://=
python-flake8_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-flake8_=
2.4.0.bb</a>}=C2=A0 =C2=A0 | 5 ++---<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-glanc=
estore_git.bb" rel=3D"noreferrer" target=3D"_blank">python-glancestore_git.=
bb</a> | 4 ++--<br>
=C2=A0.../python/{<a href=3D"http://python-pyscss_1.2.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python-pyscss_1.2.1.bb</a> =3D&gt; <a href=3D"http://=
python-pyscss_1.3.4.bb" rel=3D"noreferrer" target=3D"_blank">python-pyscss_=
1.3.4.bb</a>}=C2=A0 =C2=A0 | 5 ++---<br>
=C2=A0.../{<a href=3D"http://python-rtslib-fb_2.1.32.bb" rel=3D"noreferrer"=
 target=3D"_blank">python-rtslib-fb_2.1.32.bb</a> =3D&gt; <a href=3D"http:/=
/python-rtslib-fb_2.1.51.bb" rel=3D"noreferrer" target=3D"_blank">python-rt=
slib-fb_2.1.51.bb</a>}=C2=A0 =C2=A0| 7 +++----<br>
=C2=A0...<a href=3D"http://python-setuptools-git_1.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python-setuptools-git_1.0.bb</a> =3D&gt; <a href=3D"http=
://python-setuptools-git_1.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-setuptools-git_1.1.bb</a>} | 9 ++++-----<br>
=C2=A0...<a href=3D"http://chemy-migrate_0.9.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">chemy-migrate_0.9.1.bb</a> =3D&gt; <a href=3D"http://python-sq=
lalchemy-migrate_0.9.6.bb" rel=3D"noreferrer" target=3D"_blank">python-sqla=
lchemy-migrate_0.9.6.bb</a>} | 5 ++---<br>
=C2=A0.../python/{<a href=3D"http://python-subunit_0.0.15.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-subunit_0.0.15.bb</a> =3D&gt; <a href=3D"htt=
p://python-subunit_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-su=
bunit_1.1.0.bb</a>} | 7 +++----<br>
=C2=A0.../python/{<a href=3D"http://python-warlock_1.0.1.bb" rel=3D"norefer=
rer" target=3D"_blank">python-warlock_1.0.1.bb</a> =3D&gt; <a href=3D"http:=
//python-warlock_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-warl=
ock_1.1.0.bb</a>}=C2=A0 | 5 ++---<br>
=C2=A0...<a href=3D"http://awesome_4.1.0.0.bb" rel=3D"noreferrer" target=3D=
"_blank">awesome_4.1.0.0.bb</a> =3D&gt; <a href=3D"http://python-xstatic-fo=
nt-awesome_4.3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python-xstatic-=
font-awesome_4.3.0.0.bb</a>} | 7 +++----<br>
=C2=A0...<a href=3D"http://atic-jasmine_1.3.1.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">atic-jasmine_1.3.1.1.bb</a> =3D&gt; <a href=3D"http://python-=
xstatic-jasmine_2.1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python-xst=
atic-jasmine_2.1.2.0.bb</a>} | 7 +++----<br>
=C2=A0meta-openstack/recipes-extended/cloud-init/<a href=3D"http://cloud-in=
it_0.7.6.bb" rel=3D"noreferrer" target=3D"_blank">cloud-init_0.7.6.bb</a>=
=C2=A0 =C2=A0| 2 +-<br>
=C2=A013 files changed, 31 insertions(+), 41 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-amqp_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python-amqp_1.3.2.bb=
</a> =3D&gt; <a href=3D"http://python-amqp_1.4.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python-amqp_1.4.6.bb</a>} (71%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-fixtures_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python-fixtures_=
1.0.0.bb</a> =3D&gt; <a href=3D"http://python-fixtures_1.3.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-fixtures_1.3.1.bb</a>} (82%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-flake8_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-flake8_2.3.=
0.bb</a> =3D&gt; <a href=3D"http://python-flake8_2.4.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python-flake8_2.4.0.bb</a>} (79%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-pyscss_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-pyscss_1.2.=
1.bb</a> =3D&gt; <a href=3D"http://python-pyscss_1.3.4.bb" rel=3D"noreferre=
r" target=3D"_blank">python-pyscss_1.3.4.bb</a>} (78%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-rtslib-fb_2.1.32.bb" rel=3D"noreferrer" target=3D"_blank">python-rtslib-=
fb_2.1.32.bb</a> =3D&gt; <a href=3D"http://python-rtslib-fb_2.1.51.bb" rel=
=3D"noreferrer" target=3D"_blank">python-rtslib-fb_2.1.51.bb</a>} (66%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-setuptools-git_1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-setup=
tools-git_1.0.bb</a> =3D&gt; <a href=3D"http://python-setuptools-git_1.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python-setuptools-git_1.1.bb</a>} (6=
8%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-sqlalchemy-migrate_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
-sqlalchemy-migrate_0.9.1.bb</a> =3D&gt; <a href=3D"http://python-sqlalchem=
y-migrate_0.9.6.bb" rel=3D"noreferrer" target=3D"_blank">python-sqlalchemy-=
migrate_0.9.6.bb</a>} (80%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-subunit_0.0.15.bb" rel=3D"noreferrer" target=3D"_blank">python-subunit_0=
.0.15.bb</a> =3D&gt; <a href=3D"http://python-subunit_1.1.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python-subunit_1.1.0.bb</a>} (61%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-warlock_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.=
0.1.bb</a> =3D&gt; <a href=3D"http://python-warlock_1.1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-warlock_1.1.0.bb</a>} (77%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-xstatic-font-awesome_4.1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon-xstatic-font-awesome_4.1.0.0.bb</a> =3D&gt; <a href=3D"http://python-x=
static-font-awesome_4.3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
-xstatic-font-awesome_4.3.0.0.bb</a>} (69%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-xstatic-jasmine_1.3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-=
xstatic-jasmine_1.3.1.1.bb</a> =3D&gt; <a href=3D"http://python-xstatic-jas=
mine_2.1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python-xstatic-jasmin=
e_2.1.2.0.bb</a>} (67%)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.0<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div>

--001a1143e728a872ee0525d7179d--
