Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-da0-f43.google.com (mail-da0-f43.google.com
	[209.85.210.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F282DE00655
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:50:56 -0800 (PST)
Received: by mail-da0-f43.google.com with SMTP id u36so374375dak.30
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wSZhAbjXoi2arQmUhzEKeMvasHEwUe1iYtP7v6oRYBU=;
	b=lp1zfW34a1xFiCYO6v5g9bor272gY53IptgZonKEzCBKo6INj+8h1dMiDwZBb2YRc/
	WyDZgOvaLpok5f8/BgBeyaCTDNjKmKxC5Sy/fyeAxXnuCl06I/r23ior2RjKHH711p3x
	0AChuJ6qK0x8v5ZieYv6AyjzHxO0cR37KDpa1WEOFcNs8MfejYQiRaiwd3uccz9Pkg6K
	aRWw24/plxjwsm9AsPuW8ssWVf0RoExtg87xAFTBUztEjNBGYdZeO2yFC1mDSgxZQYQB
	NLRAxiou5+fvhZ7a2oedndySPdU6OzQRBfYCPMZwQqedWc7EL9sxKGDJR0R6uND5G8jx
	YgHQ==
MIME-Version: 1.0
Received: by 10.68.190.41 with SMTP id gn9mr7789980pbc.7.1355842256777; Tue,
	18 Dec 2012 06:50:56 -0800 (PST)
Received: by 10.68.1.68 with HTTP; Tue, 18 Dec 2012 06:50:56 -0800 (PST)
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
Date: Tue, 18 Dec 2012 09:50:56 -0500
Message-ID: <CADkTA4OPF=TdJ946osZj5NdnBYQV=hkxDx6km3yUBynFOa_h+Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org, raymond.danks@se-eng.com
Subject: Re: [RFC][PATCH 00/16] Adding python client APIs for glance, quantum and keystone
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
X-List-Received-Date: Tue, 18 Dec 2012 14:50:57 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1cb3016308204d121a099

--e89a8ff1cb3016308204d121a099
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m <david.c.nystrom@gmail.com=
>wrote:

> Sending these patches as an RFC since it includes a removal of a meta-vir=
t
> patch on
> python-2.7.3. Also, some of the common python packages might not be
> optimal to keep in the
> meta-virtualization layer, some should perhaps be sent as package updates
> to oe-core.
>
>
I'd agree that it might not be optimal to have some of the python packages
in this
layer, since they are more about access libraries, communications wrappers
and
security.

The problem with targeting oe-core is that we really need more than just
meta-virt
as a user to make them a reasonable candidate for merging. We'd need Richar=
d
or Saul to comment on the possibility of merging them to oe-core.

That being said, if it isn't oe-core, the other options seem like the
meta-networking
layer, or some of the security layers. The risk with that approach is that
we take
what is a currently simple layer dependency list and make it more
complicated.

I can't say that I like adding complexity, but if we can't get them into
oe-core, then
it makes sense, to try and get them into a common layer that holds similar
functionality.

The problem is the timeframe ... if we try and immediately place these in
the right
layer(s), then making them available at all will take some time. So from
that point
of view, we can drop them in meta-virt and start the conversation about
where they
should be in the longer term.

Comments ? I can't say that any of the options really stand out for me :)

Cheers,

Bruce


> David Nystr=F6m (16):
>   Removed meta-virtualization private patch, and using upstream instead
>   Added python-cliff recipe
>   Added python-cmd2 recipe
>   Added python-httplib2 recipe
>   Added python-jsonpatch recipe
>   Added python-jsonpointer recipe
>   Added python-jsonschema recipe
>   Added python-prettytable recipe
>   Added python-pycrypto recipe
>   Added python-pyopenssl recipe
>   Added python-pyparsing recipe
>   Added python-simplejson recipe
>   Added python-warlock recipe
>   Added python-glanceclient recipe
>   Added python-quantumclient recipe
>   Added python-keystoneclient recipe
>
>  .../glanceclient/python-glanceclient_git.bb        |   26 ++++
>  .../keystoneclient/python-keystoneclient_git.bb    |   24 ++++
>  .../quantumclient/python-quantumclient_git.bb      |   23 ++++
>  .../01-use-proper-tools-for-cross-build.patch      |  138
> --------------------
>  recipes-devtools/python/python_2.7.3.bbappend      |    9 --
>  .../files/001-remove-distribute-dependency.patch   |   24 ++++
>  recipes-python/cliff/python-cliff_1.3.bb           |   29 ++++
>  recipes-python/cmd2/python-cmd2_0.6.4.bb           |   20 +++
>  recipes-python/httplib2/python-httplib2_0.7.7.bb   |   19 +++
>  recipes-python/jsonpatch/python-jsonpatch_0.10.bb  |   20 +++
>  .../jsonpointer/python-jsonpointer_0.5.bb          |   16 +++
>  recipes-python/jsonschema/python-jsonschema_0.7.bb |   22 ++++
>  .../prettytable/python-prettytable_0.6.1.bb        |   18 +++
>  recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb  |   20 +++
>  .../pycrypto/files/001-remove-includes.patch       |   11 ++
>  recipes-python/pycrypto/python-pycrypto_2.6.bb     |   46 +++++++
>  recipes-python/pyparsing/python-pyparsing_1.5.6.bb |   22 ++++
>  .../simplejson/python-simplejson_2.6.2.bb          |   21 +++
>  recipes-python/warlock/python-warlock_0.7.0.bb     |   26 ++++
>  19 files changed, 387 insertions(+), 147 deletions(-)
>  create mode 100644 recipes-cloud/glanceclient/python-glanceclient_git.bb
>  create mode 100644 recipes-cloud/keystoneclient/
> python-keystoneclient_git.bb
>  create mode 100644 recipes-cloud/quantumclient/
> python-quantumclient_git.bb
>  delete mode 100644
> recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
>  delete mode 100644 recipes-devtools/python/python_2.7.3.bbappend
>  create mode 100644
> recipes-python/cliff/files/001-remove-distribute-dependency.patch
>  create mode 100644 recipes-python/cliff/python-cliff_1.3.bb
>  create mode 100644 recipes-python/cmd2/python-cmd2_0.6.4.bb
>  create mode 100644 recipes-python/httplib2/python-httplib2_0.7.7.bb
>  create mode 100644 recipes-python/jsonpatch/python-jsonpatch_0.10.bb
>  create mode 100644 recipes-python/jsonpointer/python-jsonpointer_0.5.bb
>  create mode 100644 recipes-python/jsonschema/python-jsonschema_0.7.bb
>  create mode 100644 recipes-python/prettytable/python-prettytable_0.6.1.b=
b
>  create mode 100644 recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb
>  create mode 100644 recipes-python/pycrypto/files/001-remove-includes.pat=
ch
>  create mode 100644 recipes-python/pycrypto/python-pycrypto_2.6.bb
>  create mode 100644 recipes-python/pyparsing/python-pyparsing_1.5.6.bb
>  create mode 100644 recipes-python/simplejson/python-simplejson_2.6.2.bb
>  create mode 100644 recipes-python/warlock/python-warlock_0.7.0.bb
>
> --
> 1.7.9.5
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8ff1cb3016308204d121a099
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, D=
ec 18, 2012 at 9:31 AM, David Nystr=F6m <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:david.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Sending these patches as an RFC since it inc=
ludes a removal of a meta-virt patch on<br>
python-2.7.3. Also, some of the common python packages might not be optimal=
 to keep in the<br>
meta-virtualization layer, some should perhaps be sent as package updates t=
o oe-core.<br>
<br></blockquote><div><br></div><div>I&#39;d agree that it might not be opt=
imal to have some of the python packages in this</div><div>layer, since the=
y are more about access libraries, communications wrappers and</div><div>
security.</div><div><br></div><div>The problem with=A0targeting=A0oe-core i=
s that we really need more than just meta-virt</div><div>as a user to make =
them a reasonable candidate for merging. We&#39;d need Richard</div><div>or=
 Saul=A0to comment on the possibility of merging them to oe-core.=A0</div>
<div><br></div><div>That being said, if it isn&#39;t oe-core, the other opt=
ions seem like the meta-networking</div><div>layer, or some of the security=
 layers. The risk with that approach is that we take</div><div>what is a cu=
rrently simple layer dependency list and make it more complicated.=A0</div>
<div><br></div><div>I can&#39;t say that I like adding complexity, but if w=
e can&#39;t get them into oe-core, then</div><div>it makes sense, to try an=
d get them into a common layer that holds similar=A0</div><div>functionalit=
y.</div>
<div><br></div><div>The problem is the timeframe ... if we try and immediat=
ely place these in the right</div><div>layer(s), then making them available=
 at all will take some time. So from that point</div><div>of view, we can d=
rop them in meta-virt and start the conversation about where they</div>
<div>should be in the longer term.</div><div><br></div><div>Comments ? I ca=
n&#39;t say that any of the options really stand out for me :)</div><div><b=
r></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">

David Nystr=F6m (16):<br>
=A0 Removed meta-virtualization private patch, and using upstream instead<b=
r>
=A0 Added python-cliff recipe<br>
=A0 Added python-cmd2 recipe<br>
=A0 Added python-httplib2 recipe<br>
=A0 Added python-jsonpatch recipe<br>
=A0 Added python-jsonpointer recipe<br>
=A0 Added python-jsonschema recipe<br>
=A0 Added python-prettytable recipe<br>
=A0 Added python-pycrypto recipe<br>
=A0 Added python-pyopenssl recipe<br>
=A0 Added python-pyparsing recipe<br>
=A0 Added python-simplejson recipe<br>
=A0 Added python-warlock recipe<br>
=A0 Added python-glanceclient recipe<br>
=A0 Added python-quantumclient recipe<br>
=A0 Added python-keystoneclient recipe<br>
<br>
=A0.../glanceclient/<a href=3D"http://python-glanceclient_git.bb" target=3D=
"_blank">python-glanceclient_git.bb</a> =A0 =A0 =A0 =A0| =A0 26 ++++<br>
=A0.../keystoneclient/<a href=3D"http://python-keystoneclient_git.bb" targe=
t=3D"_blank">python-keystoneclient_git.bb</a> =A0 =A0| =A0 24 ++++<br>
=A0.../quantumclient/<a href=3D"http://python-quantumclient_git.bb" target=
=3D"_blank">python-quantumclient_git.bb</a> =A0 =A0 =A0| =A0 23 ++++<br>
=A0.../01-use-proper-tools-for-cross-build.patch =A0 =A0 =A0| =A0138 ------=
--------------<br>
=A0recipes-devtools/python/python_2.7.3.bbappend =A0 =A0 =A0| =A0 =A09 --<b=
r>
=A0.../files/001-remove-distribute-dependency.patch =A0 | =A0 24 ++++<br>
=A0recipes-python/cliff/<a href=3D"http://python-cliff_1.3.bb" target=3D"_b=
lank">python-cliff_1.3.bb</a> =A0 =A0 =A0 =A0 =A0 | =A0 29 ++++<br>
=A0recipes-python/cmd2/<a href=3D"http://python-cmd2_0.6.4.bb" target=3D"_b=
lank">python-cmd2_0.6.4.bb</a> =A0 =A0 =A0 =A0 =A0 | =A0 20 +++<br>
=A0recipes-python/httplib2/<a href=3D"http://python-httplib2_0.7.7.bb" targ=
et=3D"_blank">python-httplib2_0.7.7.bb</a> =A0 | =A0 19 +++<br>
=A0recipes-python/jsonpatch/<a href=3D"http://python-jsonpatch_0.10.bb" tar=
get=3D"_blank">python-jsonpatch_0.10.bb</a> =A0| =A0 20 +++<br>
=A0.../jsonpointer/<a href=3D"http://python-jsonpointer_0.5.bb" target=3D"_=
blank">python-jsonpointer_0.5.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 16 +++<br>
=A0recipes-python/jsonschema/<a href=3D"http://python-jsonschema_0.7.bb" ta=
rget=3D"_blank">python-jsonschema_0.7.bb</a> | =A0 22 ++++<br>
=A0.../prettytable/<a href=3D"http://python-prettytable_0.6.1.bb" target=3D=
"_blank">python-prettytable_0.6.1.bb</a> =A0 =A0 =A0 =A0| =A0 18 +++<br>
=A0recipes-python/pyOpenSSL/<a href=3D"http://python-pyopenssl_0.13.bb" tar=
get=3D"_blank">python-pyopenssl_0.13.bb</a> =A0| =A0 20 +++<br>
=A0.../pycrypto/files/001-remove-includes.patch =A0 =A0 =A0 | =A0 11 ++<br>
=A0recipes-python/pycrypto/<a href=3D"http://python-pycrypto_2.6.bb" target=
=3D"_blank">python-pycrypto_2.6.bb</a> =A0 =A0 | =A0 46 +++++++<br>
=A0recipes-python/pyparsing/<a href=3D"http://python-pyparsing_1.5.6.bb" ta=
rget=3D"_blank">python-pyparsing_1.5.6.bb</a> | =A0 22 ++++<br>
=A0.../simplejson/<a href=3D"http://python-simplejson_2.6.2.bb" target=3D"_=
blank">python-simplejson_2.6.2.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 21 +++<br>
=A0recipes-python/warlock/<a href=3D"http://python-warlock_0.7.0.bb" target=
=3D"_blank">python-warlock_0.7.0.bb</a> =A0 =A0 | =A0 26 ++++<br>
=A019 files changed, 387 insertions(+), 147 deletions(-)<br>
=A0create mode 100644 recipes-cloud/glanceclient/<a href=3D"http://python-g=
lanceclient_git.bb" target=3D"_blank">python-glanceclient_git.bb</a><br>
=A0create mode 100644 recipes-cloud/keystoneclient/<a href=3D"http://python=
-keystoneclient_git.bb" target=3D"_blank">python-keystoneclient_git.bb</a><=
br>
=A0create mode 100644 recipes-cloud/quantumclient/<a href=3D"http://python-=
quantumclient_git.bb" target=3D"_blank">python-quantumclient_git.bb</a><br>
=A0delete mode 100644 recipes-devtools/python/python/01-use-proper-tools-fo=
r-cross-build.patch<br>
=A0delete mode 100644 recipes-devtools/python/python_2.7.3.bbappend<br>
=A0create mode 100644 recipes-python/cliff/files/001-remove-distribute-depe=
ndency.patch<br>
=A0create mode 100644 recipes-python/cliff/<a href=3D"http://python-cliff_1=
.3.bb" target=3D"_blank">python-cliff_1.3.bb</a><br>
=A0create mode 100644 recipes-python/cmd2/<a href=3D"http://python-cmd2_0.6=
.4.bb" target=3D"_blank">python-cmd2_0.6.4.bb</a><br>
=A0create mode 100644 recipes-python/httplib2/<a href=3D"http://python-http=
lib2_0.7.7.bb" target=3D"_blank">python-httplib2_0.7.7.bb</a><br>
=A0create mode 100644 recipes-python/jsonpatch/<a href=3D"http://python-jso=
npatch_0.10.bb" target=3D"_blank">python-jsonpatch_0.10.bb</a><br>
=A0create mode 100644 recipes-python/jsonpointer/<a href=3D"http://python-j=
sonpointer_0.5.bb" target=3D"_blank">python-jsonpointer_0.5.bb</a><br>
=A0create mode 100644 recipes-python/jsonschema/<a href=3D"http://python-js=
onschema_0.7.bb" target=3D"_blank">python-jsonschema_0.7.bb</a><br>
=A0create mode 100644 recipes-python/prettytable/<a href=3D"http://python-p=
rettytable_0.6.1.bb" target=3D"_blank">python-prettytable_0.6.1.bb</a><br>
=A0create mode 100644 recipes-python/pyOpenSSL/<a href=3D"http://python-pyo=
penssl_0.13.bb" target=3D"_blank">python-pyopenssl_0.13.bb</a><br>
=A0create mode 100644 recipes-python/pycrypto/files/001-remove-includes.pat=
ch<br>
=A0create mode 100644 recipes-python/pycrypto/<a href=3D"http://python-pycr=
ypto_2.6.bb" target=3D"_blank">python-pycrypto_2.6.bb</a><br>
=A0create mode 100644 recipes-python/pyparsing/<a href=3D"http://python-pyp=
arsing_1.5.6.bb" target=3D"_blank">python-pyparsing_1.5.6.bb</a><br>
=A0create mode 100644 recipes-python/simplejson/<a href=3D"http://python-si=
mplejson_2.6.2.bb" target=3D"_blank">python-simplejson_2.6.2.bb</a><br>
=A0create mode 100644 recipes-python/warlock/<a href=3D"http://python-warlo=
ck_0.7.0.bb" target=3D"_blank">python-warlock_0.7.0.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;<br>
</div>

--e89a8ff1cb3016308204d121a099--
