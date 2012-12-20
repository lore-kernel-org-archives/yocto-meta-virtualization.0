Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 600A7E011ED
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Dec 2012 08:40:01 -0800 (PST)
Received: by mail-la0-f42.google.com with SMTP id s15so3358684lag.29
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Dec 2012 08:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7FET4axikHQMYXg3AKCijhBbIRNodwFQ5F1dFP9HhuM=;
	b=fctyoSrkkv5ln1imQxKo+Hv0M6S9GMj/qnKgA/0hVxaVfgZo+tLMMkzN9N/RCFamfM
	/vOqwRvW6l9V/w0al+CkZIBKL6q8nMJyHF9oCZezI4Sn5zUmldNKlqtrnz3vyAlMHe2e
	TBxSvbFET3kPr9036syOqdv5+mcJGFvzc39ZwasBzkMtYDWop5Iq3fIkc0437JkIU/83
	HgWJjEPmUhesCqEpUMGOWDW7RkeidFgZ9sNv/AQVKT+JgcMNd0HdWBlwH2+fNyXHVd2E
	aT+o5Ub8eUsYsSUJtmcMZH1Nmkd4L4j3HsF6KULIqFzhR25PuVsxSD1RrhstYX1LVk5x
	ibcQ==
MIME-Version: 1.0
Received: by 10.152.110.18 with SMTP id hw18mr9510289lab.22.1356021599888;
	Thu, 20 Dec 2012 08:39:59 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Thu, 20 Dec 2012 08:39:59 -0800 (PST)
In-Reply-To: <50D30273.8050608@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
	<CADkTA4OPF=TdJ946osZj5NdnBYQV=hkxDx6km3yUBynFOa_h+Q@mail.gmail.com>
	<50D30273.8050608@enea.com>
Date: Thu, 20 Dec 2012 11:39:59 -0500
Message-ID: <CADkTA4MGOPwowg2SyzNLwGiqEpV20pPOAyL2X_OD7dSOsRSBwg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	"raymond.danks@se-eng.com" <raymond.danks@se-eng.com>
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
X-List-Received-Date: Thu, 20 Dec 2012 16:40:02 -0000
Content-Type: multipart/alternative; boundary=bcaec54d4de8c4e3d804d14b61e1

--bcaec54d4de8c4e3d804d14b61e1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 7:20 AM, David Nystr=F6m <david.nystrom@enea.com>wr=
ote:

>
>
> On 12/18/2012 03:50 PM, Bruce Ashfield wrote:
>
>>
>>
>>
>> On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m <david.c.nystrom@gmail.=
com
>> <mailto:david.c.nystrom@gmail.**com <david.c.nystrom@gmail.com>>> wrote:
>>
>>      Sending these patches as an RFC since it includes a removal of a
>> meta-virt
>>      patch on
>>      python-2.7.3. Also, some of the common python packages might not be
>> optimal
>>      to keep in the
>>      meta-virtualization layer, some should perhaps be sent as package
>> updates to
>>      oe-core.
>>
>>
>> I'd agree that it might not be optimal to have some of the python
>> packages in this
>> layer, since they are more about access libraries, communications
>> wrappers and
>> security.
>>
>> The problem with targeting oe-core is that we really need more than just
>> meta-virt
>> as a user to make them a reasonable candidate for merging. We'd need
>> Richard
>> or Saul to comment on the possibility of merging them to oe-core.
>>
>>
>  That being said, if it isn't oe-core, the other options seem like the
>> meta-networking
>> layer, or some of the security layers. The risk with that approach is
>> that we take
>> what is a currently simple layer dependency list and make it more
>> complicated.
>>
>> I can't say that I like adding complexity, but if we can't get them into
>> oe-core, then
>> it makes sense, to try and get them into a common layer that holds simil=
ar
>> functionality.
>>
>> The problem is the timeframe ... if we try and immediately place these i=
n
>> the right
>> layer(s), then making them available at all will take some time. So from
>> that point
>> of view, we can drop them in meta-virt and start the conversation about
>> where they
>> should be in the longer term.
>>
>> Comments ? I can't say that any of the options really stand out for me :=
)
>>
>>
> I suggest we split the recipes which we don't see direct ownership of
> (i.e. a common usecase) into recipes-external/* as a first step.
> Step two would be to find a suitable upstream for each package, with the
> end goal to have recipes-external empty.
>

That works for me as well. It makes it explicitly clear that this isn't
their final home, since
we haven't done a deeper categorization of the recipes.


>
> Somewhat OT:
> I really see some improvement the way disutils.bbclass/setuptools.**bbcla=
ss
> work today,
> I've improved create-recipe to understand python source-tarballs, early
> patch on yocto ML, which makes the tedious task of adding python
> dependencies somewhat easier. But alot of the metadata available in the
> python source packages should be able to be automated with bitbake via an
> inherited bbclass.
>

Nice. I'm running into this more often myself lately (the need to bring in
python dependencies).


>
> RDEPENDS, sub package-split et.c. most of the metadata is already avaiabl=
e
> in dist/setuptools enables packages. The added bonus of automating as muc=
h
> as possible would be a common layout of most packages. Is anyone aware of
> any previous work in this direction ?
>
>
I haven't heard of anything just like this for python packages, so it
sounds like it's worth pursuing.
If you continue to make your work in progress available, I know that I'll
be able to have a look
and help where possible.

Cheers,

Bruce


>  Cheers,
>>
>> Bruce
>>
>>      David Nystr=F6m (16):
>>         Removed meta-virtualization private patch, and using upstream
>> instead
>>         Added python-cliff recipe
>>         Added python-cmd2 recipe
>>         Added python-httplib2 recipe
>>         Added python-jsonpatch recipe
>>         Added python-jsonpointer recipe
>>         Added python-jsonschema recipe
>>         Added python-prettytable recipe
>>         Added python-pycrypto recipe
>>         Added python-pyopenssl recipe
>>         Added python-pyparsing recipe
>>         Added python-simplejson recipe
>>         Added python-warlock recipe
>>         Added python-glanceclient recipe
>>         Added python-quantumclient recipe
>>         Added python-keystoneclient recipe
>>
>>        .../glanceclient/python-**glanceclient_git.bb<http://python-glanc=
eclient_git.bb>
>>      <http://python-glanceclient_**git.bb<http://python-glanceclient_git=
.bb>>
>>        |   26 ++++
>>        .../keystoneclient/python-**keystoneclient_git.bb<http://python-k=
eystoneclient_git.bb>
>>      <http://python-keystoneclient_**git.bb<http://python-keystoneclient=
_git.bb>>
>>    |   24 ++++
>>        .../quantumclient/python-**quantumclient_git.bb<http://python-qua=
ntumclient_git.bb>
>>      <http://python-quantumclient_**git.bb<http://python-quantumclient_g=
it.bb>>
>>      |   23 ++++
>>
>>        .../01-use-proper-tools-for-**cross-build.patch      |  138
>> --------------------
>>        recipes-devtools/python/**python_2.7.3.bbappend      |    9 --
>>        .../files/001-remove-**distribute-dependency.patch   |   24 ++++
>>        recipes-python/cliff/python-**cliff_1.3.bb<http://python-cliff_1.=
3.bb><
>> http://python-cliff_1.3.bb>
>>             |   29 ++++
>>        recipes-python/cmd2/python-**cmd2_0.6.4.bb<http://python-cmd2_0.6=
.4.bb><
>> http://python-cmd2_0.6.4.bb>
>>             |   20 +++
>>        recipes-python/httplib2/python**-httplib2_0.7.7.bb<http://python-=
httplib2_0.7.7.bb>
>>      <http://python-httplib2_0.7.7.**bb <http://python-httplib2_0.7.7.bb=
>>
>>   |   19 +++
>>        recipes-python/jsonpatch/pytho**n-jsonpatch_0.10.bb<http://python=
-jsonpatch_0.10.bb>
>>      <http://python-jsonpatch_0.10.**bb <http://python-jsonpatch_0.10.bb=
>>
>>  |   20 +++
>>        .../jsonpointer/python-**jsonpointer_0.5.bb<http://python-jsonpoi=
nter_0.5.bb>
>>      <http://python-jsonpointer_0.**5.bb<http://python-jsonpointer_0.5.b=
b>>
>>          |   16 +++
>>        recipes-python/jsonschema/pyth**on-jsonschema_0.7.bb<http://pytho=
n-jsonschema_0.7.bb>
>>      <http://python-jsonschema_0.7.**bb <http://python-jsonschema_0.7.bb=
>>
>> |   22 ++++
>>        .../prettytable/python-**prettytable_0.6.1.bb<http://python-prett=
ytable_0.6.1.bb>
>>      <http://python-prettytable_0.**6.1.bb<http://python-prettytable_0.6=
.1.bb>>
>>        |   18 +++
>>        recipes-python/pyOpenSSL/pytho**n-pyopenssl_0.13.bb<http://python=
-pyopenssl_0.13.bb>
>>      <http://python-pyopenssl_0.13.**bb <http://python-pyopenssl_0.13.bb=
>>
>>  |   20 +++
>>        .../pycrypto/files/001-remove-**includes.patch       |   11 ++
>>        recipes-python/pycrypto/python**-pycrypto_2.6.bb<http://python-py=
crypto_2.6.bb>
>>      <http://python-pycrypto_2.6.bb**>     |   46 +++++++
>>        recipes-python/pyparsing/pytho**n-pyparsing_1.5.6.bb<http://pytho=
n-pyparsing_1.5.6.bb>
>>      <http://python-pyparsing_1.5.**6.bb<http://python-pyparsing_1.5.6.b=
b>>
>> |   22 ++++
>>        .../simplejson/python-**simplejson_2.6.2.bb<http://python-simplej=
son_2.6.2.bb>
>>      <http://python-simplejson_2.6.**2.bb<http://python-simplejson_2.6.2=
.bb>>
>>          |   21 +++
>>        recipes-python/warlock/python-**warlock_0.7.0.bb<http://python-wa=
rlock_0.7.0.bb>
>>      <http://python-warlock_0.7.0.**bb <http://python-warlock_0.7.0.bb>>
>>     |   26 ++++
>>
>>        19 files changed, 387 insertions(+), 147 deletions(-)
>>        create mode 100644 recipes-cloud/glanceclient/pyt**
>> hon-glanceclient_git.bb <http://python-glanceclient_git.bb>
>>      <http://python-glanceclient_**git.bb<http://python-glanceclient_git=
.bb>
>> >
>>        create mode 100644
>>      recipes-cloud/keystoneclient/p**ython-keystoneclient_git.bb<http://=
python-keystoneclient_git.bb>
>>      <http://python-keystoneclient_**git.bb<http://python-keystoneclient=
_git.bb>
>> >
>>        create mode 100644 recipes-cloud/quantumclient/py**
>> thon-quantumclient_git.bb <http://python-quantumclient_git.bb>
>>      <http://python-quantumclient_**git.bb<http://python-quantumclient_g=
it.bb>
>> >
>>
>>        delete mode 100644
>>      recipes-devtools/python/**python/01-use-proper-tools-**
>> for-cross-build.patch
>>        delete mode 100644 recipes-devtools/python/**python_2.7.3.bbappen=
d
>>        create mode 100644
>>      recipes-python/cliff/files/**001-remove-distribute-**
>> dependency.patch
>>        create mode 100644 recipes-python/cliff/python-**cliff_1.3.bb<htt=
p://python-cliff_1.3.bb>
>>      <http://python-cliff_1.3.bb>
>>        create mode 100644 recipes-python/cmd2/python-**cmd2_0.6.4.bb<htt=
p://python-cmd2_0.6.4.bb>
>>      <http://python-cmd2_0.6.4.bb>
>>        create mode 100644 recipes-python/httplib2/python**
>> -httplib2_0.7.7.bb <http://python-httplib2_0.7.7.bb>
>>      <http://python-httplib2_0.7.7.**bb <http://python-httplib2_0.7.7.bb=
>
>> >
>>        create mode 100644 recipes-python/jsonpatch/pytho**
>> n-jsonpatch_0.10.bb <http://python-jsonpatch_0.10.bb>
>>      <http://python-jsonpatch_0.10.**bb <http://python-jsonpatch_0.10.bb=
>
>> >
>>        create mode 100644 recipes-python/jsonpointer/pyt**
>> hon-jsonpointer_0.5.bb <http://python-jsonpointer_0.5.bb>
>>      <http://python-jsonpointer_0.**5.bb<http://python-jsonpointer_0.5.b=
b>
>> >
>>        create mode 100644 recipes-python/jsonschema/pyth**
>> on-jsonschema_0.7.bb <http://python-jsonschema_0.7.bb>
>>      <http://python-jsonschema_0.7.**bb <http://python-jsonschema_0.7.bb=
>
>> >
>>        create mode 100644 recipes-python/prettytable/pyt**
>> hon-prettytable_0.6.1.bb <http://python-prettytable_0.6.1.bb>
>>      <http://python-prettytable_0.**6.1.bb<http://python-prettytable_0.6=
.1.bb>
>> >
>>        create mode 100644 recipes-python/pyOpenSSL/pytho**
>> n-pyopenssl_0.13.bb <http://python-pyopenssl_0.13.bb>
>>      <http://python-pyopenssl_0.13.**bb <http://python-pyopenssl_0.13.bb=
>
>> >
>>
>>        create mode 100644 recipes-python/pycrypto/files/**
>> 001-remove-includes.patch
>>        create mode 100644 recipes-python/pycrypto/python**
>> -pycrypto_2.6.bb <http://python-pycrypto_2.6.bb>
>>      <http://python-pycrypto_2.6.bb**>
>>        create mode 100644 recipes-python/pyparsing/pytho**
>> n-pyparsing_1.5.6.bb <http://python-pyparsing_1.5.6.bb>
>>      <http://python-pyparsing_1.5.**6.bb<http://python-pyparsing_1.5.6.b=
b>
>> >
>>        create mode 100644 recipes-python/simplejson/pyth**
>> on-simplejson_2.6.2.bb <http://python-simplejson_2.6.2.bb>
>>      <http://python-simplejson_2.6.**2.bb<http://python-simplejson_2.6.2=
.bb>
>> >
>>        create mode 100644 recipes-python/warlock/python-**
>> warlock_0.7.0.bb <http://python-warlock_0.7.0.bb>
>>      <http://python-warlock_0.7.0.**bb <http://python-warlock_0.7.0.bb>>
>>
>>
>>      --
>>      1.7.9.5
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
>> at its
>> end"
>>
>>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec54d4de8c4e3d804d14b61e1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 20, 2012 at 7:20 AM, David Nystr=F6m <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:david.nystrom@enea.com" target=3D"_blank">david.nystrom@enea.com</a>&g=
t;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><br>
<br>
On 12/18/2012 03:50 PM, Bruce Ashfield wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
<br>
On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m &lt;<a href=3D"mailto:davi=
d.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a><br><=
/div><div><div class=3D"h5">
&lt;mailto:<a href=3D"mailto:david.c.nystrom@gmail.com" target=3D"_blank">d=
avid.c.nystrom@gmail.<u></u>com</a>&gt;&gt; wrote:<br>
<br>
=A0 =A0 =A0Sending these patches as an RFC since it includes a removal of a=
 meta-virt<br>
=A0 =A0 =A0patch on<br>
=A0 =A0 =A0python-2.7.3. Also, some of the common python packages might not=
 be optimal<br>
=A0 =A0 =A0to keep in the<br>
=A0 =A0 =A0meta-virtualization layer, some should perhaps be sent as packag=
e updates to<br>
=A0 =A0 =A0oe-core.<br>
<br>
<br>
I&#39;d agree that it might not be optimal to have some of the python packa=
ges in this<br>
layer, since they are more about access libraries, communications wrappers =
and<br>
security.<br>
<br>
The problem with targeting oe-core is that we really need more than just me=
ta-virt<br>
as a user to make them a reasonable candidate for merging. We&#39;d need Ri=
chard<br>
or Saul to comment on the possibility of merging them to oe-core.<br>
<br>
</div></div></blockquote><div><div class=3D"h5">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
That being said, if it isn&#39;t oe-core, the other options seem like the<b=
r>
meta-networking<br>
layer, or some of the security layers. The risk with that approach is that =
we take<br>
what is a currently simple layer dependency list and make it more complicat=
ed.<br>
<br>
I can&#39;t say that I like adding complexity, but if we can&#39;t get them=
 into<br>
oe-core, then<br>
it makes sense, to try and get them into a common layer that holds similar<=
br>
functionality.<br>
<br>
The problem is the timeframe ... if we try and immediately place these in t=
he right<br>
layer(s), then making them available at all will take some time. So from th=
at point<br>
of view, we can drop them in meta-virt and start the conversation about whe=
re they<br>
should be in the longer term.<br>
<br>
Comments ? I can&#39;t say that any of the options really stand out for me =
:)<br>
<br>
</blockquote>
<br></div></div>
I suggest we split the recipes which we don&#39;t see direct ownership of (=
i.e. a common usecase) into recipes-external/* as a first step.<br>
Step two would be to find a suitable upstream for each package, with the en=
d goal to have recipes-external empty.<br></blockquote><div><br></div><div>=
That works for me as well. It makes it explicitly clear that this isn&#39;t=
 their final home, since</div>
<div>we haven&#39;t done a deeper categorization of the recipes.</div><div>=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Somewhat OT:<br>
I really see some improvement the way disutils.bbclass/setuptools.<u></u>bb=
class work today,<br>
I&#39;ve improved create-recipe to understand python source-tarballs, early=
 patch on yocto ML, which makes the tedious task of adding python dependenc=
ies somewhat easier. But alot of the metadata available in the python sourc=
e packages should be able to be automated with bitbake via an inherited bbc=
lass.<br>
</blockquote><div><br></div><div>Nice. I&#39;m running into this more often=
 myself lately (the need to bring in python dependencies).</div><div>=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">

<br>
RDEPENDS, sub package-split et.c. most of the metadata is already avaiable =
in dist/setuptools enables packages. The added bonus of automating as much =
as possible would be a common layout of most packages. Is anyone aware of a=
ny previous work in this direction ?<br>

<br></blockquote><div><br></div><div>I haven&#39;t heard of anything just l=
ike this for python packages, so it sounds like it&#39;s worth pursuing.</d=
iv><div>If you continue to make your work in progress available, I know tha=
t I&#39;ll be able to have a look</div>
<div>and help where possible.</div><div><br></div><div>Cheers,</div><div><b=
r></div><div>Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
Cheers,<br>
<br>
Bruce<br>
<br>
=A0 =A0 =A0David Nystr=F6m (16):<br>
=A0 =A0 =A0 =A0 Removed meta-virtualization private patch, and using upstre=
am instead<br>
=A0 =A0 =A0 =A0 Added python-cliff recipe<br>
=A0 =A0 =A0 =A0 Added python-cmd2 recipe<br>
=A0 =A0 =A0 =A0 Added python-httplib2 recipe<br>
=A0 =A0 =A0 =A0 Added python-jsonpatch recipe<br>
=A0 =A0 =A0 =A0 Added python-jsonpointer recipe<br>
=A0 =A0 =A0 =A0 Added python-jsonschema recipe<br>
=A0 =A0 =A0 =A0 Added python-prettytable recipe<br>
=A0 =A0 =A0 =A0 Added python-pycrypto recipe<br>
=A0 =A0 =A0 =A0 Added python-pyopenssl recipe<br>
=A0 =A0 =A0 =A0 Added python-pyparsing recipe<br>
=A0 =A0 =A0 =A0 Added python-simplejson recipe<br>
=A0 =A0 =A0 =A0 Added python-warlock recipe<br>
=A0 =A0 =A0 =A0 Added python-glanceclient recipe<br>
=A0 =A0 =A0 =A0 Added python-quantumclient recipe<br>
=A0 =A0 =A0 =A0 Added python-keystoneclient recipe<br>
<br>
=A0 =A0 =A0 =A0.../glanceclient/<a href=3D"http://python-glanceclient_git.b=
b" target=3D"_blank">python-<u></u>glanceclient_git.bb</a><br></div>
=A0 =A0 =A0&lt;<a href=3D"http://python-glanceclient_git.bb" target=3D"_bla=
nk">http://python-glanceclient_<u></u>git.bb</a>&gt; =A0 =A0 =A0 =A0| =A0 2=
6 ++++<br>
=A0 =A0 =A0 =A0.../keystoneclient/<a href=3D"http://python-keystoneclient_g=
it.bb" target=3D"_blank">python-<u></u>keystoneclient_git.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-keystoneclient_git.bb" target=3D"_b=
lank">http://python-keystoneclient_<u></u>git.bb</a>&gt; =A0 =A0| =A0 24 ++=
++<br>
=A0 =A0 =A0 =A0.../quantumclient/<a href=3D"http://python-quantumclient_git=
.bb" target=3D"_blank">python-<u></u>quantumclient_git.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-quantumclient_git.bb" target=3D"_bl=
ank">http://python-quantumclient_<u></u>git.bb</a>&gt; =A0 =A0 =A0| =A0 23 =
++++<div class=3D"im"><br>
=A0 =A0 =A0 =A0.../01-use-proper-tools-for-<u></u>cross-build.patch =A0 =A0=
 =A0| =A0138 --------------------<br>
=A0 =A0 =A0 =A0recipes-devtools/python/<u></u>python_2.7.3.bbappend =A0 =A0=
 =A0| =A0 =A09 --<br>
=A0 =A0 =A0 =A0.../files/001-remove-<u></u>distribute-dependency.patch =A0 =
| =A0 24 ++++<br></div>
=A0 =A0 =A0 =A0recipes-python/cliff/<a href=3D"http://python-cliff_1.3.bb" =
target=3D"_blank">python-<u></u>cliff_1.3.bb</a> &lt;<a href=3D"http://pyth=
on-cliff_1.3.bb" target=3D"_blank">http://python-cliff_1.3.bb</a>&gt;<br>
=A0 =A0 =A0 =A0 =A0 =A0 | =A0 29 ++++<br>
=A0 =A0 =A0 =A0recipes-python/cmd2/<a href=3D"http://python-cmd2_0.6.4.bb" =
target=3D"_blank">python-<u></u>cmd2_0.6.4.bb</a> &lt;<a href=3D"http://pyt=
hon-cmd2_0.6.4.bb" target=3D"_blank">http://python-cmd2_0.6.4.bb</a>&gt;<br=
>
=A0 =A0 =A0 =A0 =A0 =A0 | =A0 20 +++<br>
=A0 =A0 =A0 =A0recipes-python/httplib2/<a href=3D"http://python-httplib2_0.=
7.7.bb" target=3D"_blank">python<u></u>-httplib2_0.7.7.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-httplib2_0.7.7.bb" target=3D"_blank=
">http://python-httplib2_0.7.7.<u></u>bb</a>&gt; =A0 | =A0 19 +++<br>
=A0 =A0 =A0 =A0recipes-python/jsonpatch/<a href=3D"http://python-jsonpatch_=
0.10.bb" target=3D"_blank">pytho<u></u>n-jsonpatch_0.10.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-jsonpatch_0.10.bb" target=3D"_blank=
">http://python-jsonpatch_0.10.<u></u>bb</a>&gt; =A0| =A0 20 +++<br>
=A0 =A0 =A0 =A0.../jsonpointer/<a href=3D"http://python-jsonpointer_0.5.bb"=
 target=3D"_blank">python-<u></u>jsonpointer_0.5.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-jsonpointer_0.5.bb" target=3D"_blan=
k">http://python-jsonpointer_0.<u></u>5.bb</a>&gt; =A0 =A0 =A0 =A0 =A0| =A0=
 16 +++<br>
=A0 =A0 =A0 =A0recipes-python/jsonschema/<a href=3D"http://python-jsonschem=
a_0.7.bb" target=3D"_blank">pyth<u></u>on-jsonschema_0.7.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-jsonschema_0.7.bb" target=3D"_blank=
">http://python-jsonschema_0.7.<u></u>bb</a>&gt; | =A0 22 ++++<br>
=A0 =A0 =A0 =A0.../prettytable/<a href=3D"http://python-prettytable_0.6.1.b=
b" target=3D"_blank">python-<u></u>prettytable_0.6.1.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-prettytable_0.6.1.bb" target=3D"_bl=
ank">http://python-prettytable_0.<u></u>6.1.bb</a>&gt; =A0 =A0 =A0 =A0| =A0=
 18 +++<br>
=A0 =A0 =A0 =A0recipes-python/pyOpenSSL/<a href=3D"http://python-pyopenssl_=
0.13.bb" target=3D"_blank">pytho<u></u>n-pyopenssl_0.13.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-pyopenssl_0.13.bb" target=3D"_blank=
">http://python-pyopenssl_0.13.<u></u>bb</a>&gt; =A0| =A0 20 +++<br>
=A0 =A0 =A0 =A0.../pycrypto/files/001-remove-<u></u>includes.patch =A0 =A0 =
=A0 | =A0 11 ++<br>
=A0 =A0 =A0 =A0recipes-python/pycrypto/<a href=3D"http://python-pycrypto_2.=
6.bb" target=3D"_blank">python<u></u>-pycrypto_2.6.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-pycrypto_2.6.bb" target=3D"_blank">=
http://python-pycrypto_2.6.bb</a><u></u>&gt; =A0 =A0 | =A0 46 +++++++<br>
=A0 =A0 =A0 =A0recipes-python/pyparsing/<a href=3D"http://python-pyparsing_=
1.5.6.bb" target=3D"_blank">pytho<u></u>n-pyparsing_1.5.6.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-pyparsing_1.5.6.bb" target=3D"_blan=
k">http://python-pyparsing_1.5.<u></u>6.bb</a>&gt; | =A0 22 ++++<br>
=A0 =A0 =A0 =A0.../simplejson/<a href=3D"http://python-simplejson_2.6.2.bb"=
 target=3D"_blank">python-<u></u>simplejson_2.6.2.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-simplejson_2.6.2.bb" target=3D"_bla=
nk">http://python-simplejson_2.6.<u></u>2.bb</a>&gt; =A0 =A0 =A0 =A0 =A0| =
=A0 21 +++<br>
=A0 =A0 =A0 =A0recipes-python/warlock/<a href=3D"http://python-warlock_0.7.=
0.bb" target=3D"_blank">python-<u></u>warlock_0.7.0.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-warlock_0.7.0.bb" target=3D"_blank"=
>http://python-warlock_0.7.0.<u></u>bb</a>&gt; =A0 =A0 | =A0 26 ++++<div cl=
ass=3D"im"><br>
=A0 =A0 =A0 =A019 files changed, 387 insertions(+), 147 deletions(-)<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-cloud/glanceclient/<a href=3D"htt=
p://python-glanceclient_git.bb" target=3D"_blank">pyt<u></u>hon-glanceclien=
t_git.bb</a><br></div>
=A0 =A0 =A0&lt;<a href=3D"http://python-glanceclient_git.bb" target=3D"_bla=
nk">http://python-glanceclient_<u></u>git.bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644<br>
=A0 =A0 =A0recipes-cloud/keystoneclient/<a href=3D"http://python-keystonecl=
ient_git.bb" target=3D"_blank">p<u></u>ython-keystoneclient_git.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-keystoneclient_git.bb" target=3D"_b=
lank">http://python-keystoneclient_<u></u>git.bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-cloud/quantumclient/<a href=3D"ht=
tp://python-quantumclient_git.bb" target=3D"_blank">py<u></u>thon-quantumcl=
ient_git.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-quantumclient_git.bb" target=3D"_bl=
ank">http://python-quantumclient_<u></u>git.bb</a>&gt;<div class=3D"im"><br=
>
=A0 =A0 =A0 =A0delete mode 100644<br>
=A0 =A0 =A0recipes-devtools/python/<u></u>python/01-use-proper-tools-<u></u=
>for-cross-build.patch<br>
=A0 =A0 =A0 =A0delete mode 100644 recipes-devtools/python/<u></u>python_2.7=
.3.bbappend<br>
=A0 =A0 =A0 =A0create mode 100644<br>
=A0 =A0 =A0recipes-python/cliff/files/<u></u>001-remove-distribute-<u></u>d=
ependency.patch<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/cliff/<a href=3D"http://py=
thon-cliff_1.3.bb" target=3D"_blank">python-<u></u>cliff_1.3.bb</a><br></di=
v>
=A0 =A0 =A0&lt;<a href=3D"http://python-cliff_1.3.bb" target=3D"_blank">htt=
p://python-cliff_1.3.bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/cmd2/<a href=3D"http://pyt=
hon-cmd2_0.6.4.bb" target=3D"_blank">python-<u></u>cmd2_0.6.4.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-cmd2_0.6.4.bb" target=3D"_blank">ht=
tp://python-cmd2_0.6.4.bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/httplib2/<a href=3D"http:/=
/python-httplib2_0.7.7.bb" target=3D"_blank">python<u></u>-httplib2_0.7.7.b=
b</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-httplib2_0.7.7.bb" target=3D"_blank=
">http://python-httplib2_0.7.7.<u></u>bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/jsonpatch/<a href=3D"http:=
//python-jsonpatch_0.10.bb" target=3D"_blank">pytho<u></u>n-jsonpatch_0.10.=
bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-jsonpatch_0.10.bb" target=3D"_blank=
">http://python-jsonpatch_0.10.<u></u>bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/jsonpointer/<a href=3D"htt=
p://python-jsonpointer_0.5.bb" target=3D"_blank">pyt<u></u>hon-jsonpointer_=
0.5.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-jsonpointer_0.5.bb" target=3D"_blan=
k">http://python-jsonpointer_0.<u></u>5.bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/jsonschema/<a href=3D"http=
://python-jsonschema_0.7.bb" target=3D"_blank">pyth<u></u>on-jsonschema_0.7=
.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-jsonschema_0.7.bb" target=3D"_blank=
">http://python-jsonschema_0.7.<u></u>bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/prettytable/<a href=3D"htt=
p://python-prettytable_0.6.1.bb" target=3D"_blank">pyt<u></u>hon-prettytabl=
e_0.6.1.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-prettytable_0.6.1.bb" target=3D"_bl=
ank">http://python-prettytable_0.<u></u>6.1.bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/pyOpenSSL/<a href=3D"http:=
//python-pyopenssl_0.13.bb" target=3D"_blank">pytho<u></u>n-pyopenssl_0.13.=
bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-pyopenssl_0.13.bb" target=3D"_blank=
">http://python-pyopenssl_0.13.<u></u>bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/pycrypto/files/<u></u>001-=
remove-includes.patch<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/pycrypto/<a href=3D"http:/=
/python-pycrypto_2.6.bb" target=3D"_blank">python<u></u>-pycrypto_2.6.bb</a=
><br></div>
=A0 =A0 =A0&lt;<a href=3D"http://python-pycrypto_2.6.bb" target=3D"_blank">=
http://python-pycrypto_2.6.bb</a><u></u>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/pyparsing/<a href=3D"http:=
//python-pyparsing_1.5.6.bb" target=3D"_blank">pytho<u></u>n-pyparsing_1.5.=
6.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-pyparsing_1.5.6.bb" target=3D"_blan=
k">http://python-pyparsing_1.5.<u></u>6.bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/simplejson/<a href=3D"http=
://python-simplejson_2.6.2.bb" target=3D"_blank">pyth<u></u>on-simplejson_2=
.6.2.bb</a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-simplejson_2.6.2.bb" target=3D"_bla=
nk">http://python-simplejson_2.6.<u></u>2.bb</a>&gt;<br>
=A0 =A0 =A0 =A0create mode 100644 recipes-python/warlock/<a href=3D"http://=
python-warlock_0.7.0.bb" target=3D"_blank">python-<u></u>warlock_0.7.0.bb</=
a><br>
=A0 =A0 =A0&lt;<a href=3D"http://python-warlock_0.7.0.bb" target=3D"_blank"=
>http://python-warlock_0.7.0.<u></u>bb</a>&gt;<div class=3D"im"><br>
<br>
=A0 =A0 =A0--<br>
=A0 =A0 =A01.7.9.5<br>
<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its<br>
end&quot;<br>
<br>
</div></blockquote>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;<br>
</div>

--bcaec54d4de8c4e3d804d14b61e1--
