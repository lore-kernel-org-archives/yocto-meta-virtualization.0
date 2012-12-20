Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id DE952E00559
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Dec 2012 04:20:18 -0800 (PST)
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.2.318.1;
	Thu, 20 Dec 2012 13:20:17 +0100
Message-ID: <50D30273.8050608@enea.com>
Date: Thu, 20 Dec 2012 13:20:03 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
	<CADkTA4OPF=TdJ946osZj5NdnBYQV=hkxDx6km3yUBynFOa_h+Q@mail.gmail.com>
In-Reply-To: <CADkTA4OPF=TdJ946osZj5NdnBYQV=hkxDx6km3yUBynFOa_h+Q@mail.gmail.com>
X-Originating-IP: [172.16.140.28]
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
X-List-Received-Date: Thu, 20 Dec 2012 12:20:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 12/18/2012 03:50 PM, Bruce Ashfield wrote:
>
>
>
> On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m <david.c.nystrom@gmail.c=
om
> <mailto:david.c.nystrom@gmail.com>> wrote:
>
>      Sending these patches as an RFC since it includes a removal of a met=
a-virt
>      patch on
>      python-2.7.3. Also, some of the common python packages might not be =
optimal
>      to keep in the
>      meta-virtualization layer, some should perhaps be sent as package up=
dates to
>      oe-core.
>
>
> I'd agree that it might not be optimal to have some of the python package=
s in this
> layer, since they are more about access libraries, communications wrapper=
s and
> security.
>
> The problem with targeting oe-core is that we really need more than just =
meta-virt
> as a user to make them a reasonable candidate for merging. We'd need Rich=
ard
> or Saul to comment on the possibility of merging them to oe-core.
>

> That being said, if it isn't oe-core, the other options seem like the
> meta-networking
> layer, or some of the security layers. The risk with that approach is tha=
t we take
> what is a currently simple layer dependency list and make it more complic=
ated.
>
> I can't say that I like adding complexity, but if we can't get them into
> oe-core, then
> it makes sense, to try and get them into a common layer that holds simila=
r
> functionality.
>
> The problem is the timeframe ... if we try and immediately place these in=
 the right
> layer(s), then making them available at all will take some time. So from =
that point
> of view, we can drop them in meta-virt and start the conversation about w=
here they
> should be in the longer term.
>
> Comments ? I can't say that any of the options really stand out for me :)
>

I suggest we split the recipes which we don't see direct ownership of=20
(i.e. a common usecase) into recipes-external/* as a first step.
Step two would be to find a suitable upstream for each package, with the=20
end goal to have recipes-external empty.

Somewhat OT:
I really see some improvement the way=20
disutils.bbclass/setuptools.bbclass work today,
I've improved create-recipe to understand python source-tarballs, early=20
patch on yocto ML, which makes the tedious task of adding python=20
dependencies somewhat easier. But alot of the metadata available in the=20
python source packages should be able to be automated with bitbake via=20
an inherited bbclass.

RDEPENDS, sub package-split et.c. most of the metadata is already=20
avaiable in dist/setuptools enables packages. The added bonus of=20
automating as much as possible would be a common layout of most=20
packages. Is anyone aware of any previous work in this direction ?

> Cheers,
>
> Bruce
>
>      David Nystr=F6m (16):
>         Removed meta-virtualization private patch, and using upstream ins=
tead
>         Added python-cliff recipe
>         Added python-cmd2 recipe
>         Added python-httplib2 recipe
>         Added python-jsonpatch recipe
>         Added python-jsonpointer recipe
>         Added python-jsonschema recipe
>         Added python-prettytable recipe
>         Added python-pycrypto recipe
>         Added python-pyopenssl recipe
>         Added python-pyparsing recipe
>         Added python-simplejson recipe
>         Added python-warlock recipe
>         Added python-glanceclient recipe
>         Added python-quantumclient recipe
>         Added python-keystoneclient recipe
>
>        .../glanceclient/python-glanceclient_git.bb
>      <http://python-glanceclient_git.bb>        |   26 ++++
>        .../keystoneclient/python-keystoneclient_git.bb
>      <http://python-keystoneclient_git.bb>    |   24 ++++
>        .../quantumclient/python-quantumclient_git.bb
>      <http://python-quantumclient_git.bb>      |   23 ++++
>        .../01-use-proper-tools-for-cross-build.patch      |  138 --------=
------------
>        recipes-devtools/python/python_2.7.3.bbappend      |    9 --
>        .../files/001-remove-distribute-dependency.patch   |   24 ++++
>        recipes-python/cliff/python-cliff_1.3.bb <http://python-cliff_1.3.=
bb>
>             |   29 ++++
>        recipes-python/cmd2/python-cmd2_0.6.4.bb <http://python-cmd2_0.6.4=
.bb>
>             |   20 +++
>        recipes-python/httplib2/python-httplib2_0.7.7.bb
>      <http://python-httplib2_0.7.7.bb>   |   19 +++
>        recipes-python/jsonpatch/python-jsonpatch_0.10.bb
>      <http://python-jsonpatch_0.10.bb>  |   20 +++
>        .../jsonpointer/python-jsonpointer_0.5.bb
>      <http://python-jsonpointer_0.5.bb>          |   16 +++
>        recipes-python/jsonschema/python-jsonschema_0.7.bb
>      <http://python-jsonschema_0.7.bb> |   22 ++++
>        .../prettytable/python-prettytable_0.6.1.bb
>      <http://python-prettytable_0.6.1.bb>        |   18 +++
>        recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb
>      <http://python-pyopenssl_0.13.bb>  |   20 +++
>        .../pycrypto/files/001-remove-includes.patch       |   11 ++
>        recipes-python/pycrypto/python-pycrypto_2.6.bb
>      <http://python-pycrypto_2.6.bb>     |   46 +++++++
>        recipes-python/pyparsing/python-pyparsing_1.5.6.bb
>      <http://python-pyparsing_1.5.6.bb> |   22 ++++
>        .../simplejson/python-simplejson_2.6.2.bb
>      <http://python-simplejson_2.6.2.bb>          |   21 +++
>        recipes-python/warlock/python-warlock_0.7.0.bb
>      <http://python-warlock_0.7.0.bb>     |   26 ++++
>        19 files changed, 387 insertions(+), 147 deletions(-)
>        create mode 100644 recipes-cloud/glanceclient/python-glanceclient_=
git.bb
>      <http://python-glanceclient_git.bb>
>        create mode 100644
>      recipes-cloud/keystoneclient/python-keystoneclient_git.bb
>      <http://python-keystoneclient_git.bb>
>        create mode 100644 recipes-cloud/quantumclient/python-quantumclien=
t_git.bb
>      <http://python-quantumclient_git.bb>
>        delete mode 100644
>      recipes-devtools/python/python/01-use-proper-tools-for-cross-build.p=
atch
>        delete mode 100644 recipes-devtools/python/python_2.7.3.bbappend
>        create mode 100644
>      recipes-python/cliff/files/001-remove-distribute-dependency.patch
>        create mode 100644 recipes-python/cliff/python-cliff_1.3.bb
>      <http://python-cliff_1.3.bb>
>        create mode 100644 recipes-python/cmd2/python-cmd2_0.6.4.bb
>      <http://python-cmd2_0.6.4.bb>
>        create mode 100644 recipes-python/httplib2/python-httplib2_0.7.7.b=
b
>      <http://python-httplib2_0.7.7.bb>
>        create mode 100644 recipes-python/jsonpatch/python-jsonpatch_0.10.=
bb
>      <http://python-jsonpatch_0.10.bb>
>        create mode 100644 recipes-python/jsonpointer/python-jsonpointer_0=
.5.bb
>      <http://python-jsonpointer_0.5.bb>
>        create mode 100644 recipes-python/jsonschema/python-jsonschema_0.7=
.bb
>      <http://python-jsonschema_0.7.bb>
>        create mode 100644 recipes-python/prettytable/python-prettytable_0=
.6.1.bb
>      <http://python-prettytable_0.6.1.bb>
>        create mode 100644 recipes-python/pyOpenSSL/python-pyopenssl_0.13.=
bb
>      <http://python-pyopenssl_0.13.bb>
>        create mode 100644 recipes-python/pycrypto/files/001-remove-includ=
es.patch
>        create mode 100644 recipes-python/pycrypto/python-pycrypto_2.6.bb
>      <http://python-pycrypto_2.6.bb>
>        create mode 100644 recipes-python/pyparsing/python-pyparsing_1.5.6=
.bb
>      <http://python-pyparsing_1.5.6.bb>
>        create mode 100644 recipes-python/simplejson/python-simplejson_2.6=
.2.bb
>      <http://python-simplejson_2.6.2.bb>
>        create mode 100644 recipes-python/warlock/python-warlock_0.7.0.bb
>      <http://python-warlock_0.7.0.bb>
>
>      --
>      1.7.9.5
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its
> end"
>

