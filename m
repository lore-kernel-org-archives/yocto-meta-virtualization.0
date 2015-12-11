Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A245E00BF4; Fri, 11 Dec 2015 09:17:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.45 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C24AE00BEB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:16:50 -0800 (PST)
Received: by vkay187 with SMTP id y187so119635122vka.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HvcSHNL44nuKUKAlCYHOa3i/aQhntLhSTE8gyEaBZmE=;
	b=Z9xk8QHOX+SrnGB3n3jD0CDYq+Ekaz9QcjPj4sykcpWkp/F9suza0XH+xgdnf01iw8
	+IX+cOuGmSAknIRAIa9pMt/QN28unF6CblELdFMSyyCB/3gizbVjyI0hEG9CiAHzTKpi
	VhgUC4kyZpwHlU9MCBpPnerCo9+KXtUT5bXb1nOjEs6NOXxDJLnxvPdqSeWSKPfri2Bt
	jOIyY2qanaD6kP4wb6vBsDSS+y7N7WcvYxEeeEOIlfOSwJ1yYar9/pGxYpBWUkpip5Mn
	lHIrPY+1jwzL3FAo5C1BkXdUwM2MHrwC3zHpzKZyCC7CVr8luNXifrNSUmTbf/DtCtz4
	rbHw==
MIME-Version: 1.0
X-Received: by 10.31.174.142 with SMTP id x136mr15415626vke.11.1449854209399; 
	Fri, 11 Dec 2015 09:16:49 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Fri, 11 Dec 2015 09:16:49 -0800 (PST)
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
Date: Fri, 11 Dec 2015 12:16:49 -0500
Message-ID: <CADkTA4PZCxNCZN6LeeHbN-CRu_-RPKZL13amjUsNy2FQKqEvXA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 00/42] Updates for fido-kilo
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
X-List-Received-Date: Fri, 11 Dec 2015 17:17:00 -0000
Content-Type: multipart/alternative; boundary=001a11438eb2209e890526a27d4c

--001a11438eb2209e890526a27d4c
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 8, 2015 at 12:33 PM, Josep Puigdemont <josep.puigdemont@enea.com
> wrote:

> Hi,
>
> A few comments on this patch series:
>
> * It contains several cherry-picks from master that are also needed in
> fido-kilo.
>
> * I had to cherry-pick django-pyscss 2.0.2 from master, although Kilo's
> requirements have a cap on this package (>=1.0.3,<2.0.0), but horizon
> wouldn't work otherwise.
>
> * There are also a few upgrades to Openstack Kilo 2015.1.2 that were
> missing
> from the previous series (and a new recipe for oslo.versionedobjects).
>
> * Various dependencies have been added, and NAT as well as TUN kernel
> modules
> are added to the compute image too.
>
> * The last pacth is the only one I think may be a bit controversial
> (because
> it's rather ugly). Maybe you have some suggestions on how to solve the
> issue
> described in the commit message. I have put everything in one patch so it
> is
> easy to remove later, or to discard altogether. Without this patch the
> images
> won't work out of the box, but it can be fixed by adding a simple sed
> command
> to IMAGE_POSTPROCESS_COMMAND that does the same.
>
>
> I have tested this using both the AIO image and comupte+controller images
> on qemu. Only the AIO image has been tested on real HW.
>
> I'm sorry for the large patch sets! I believe this is the last series for
> fido-kilo I have. I hope I can work with master and Liberty pretty soon.
>


I've merged the series to fido-kilo, with the v2 class used for argparse
fixups.

I also cherry picked a modified version of the class to master, so we can
start
using it there for fixups as well.

Cheers,

Bruce


>
> Thanks,
>
> /Josep
>
> Jackie Huang (8):
>   python-pathlib: add new recipe
>   python-django-pyscss: add missing rdepends on python-pathlib
>   python-enum: add new recipe
>   python-pyscss: add missing rdepends on python-enum
>   python-repoze.lru: add new recipe
>   python-routes: add rdepends on python-repoze.lru
>   python-nova: add missing rdepends
>   python-eventlet: upgrade 0.17.1 -> 0.17.4
>
> Josep Puigdemont (12):
>   python-sqlalchemy-migrate: depends on sqlparse
>   python-cliff: Fix object has no attribute debug error
>   python-nova: dependency on blkid
>   yocto-kernel: enable NAT
>   python-pbr: upgrade to 0.11
>   python-novaclient: upgrade to 2.23.2
>   python-ceilometer: upgrade to 2015.1.2
>   python-oslo.versionedobjects: added recipe
>   python-heat: update to 2015.1.2
>   packagegroup-cloud-compute: add tun kernel module
>   packagegroup-cloud-extras: include xterm only if x11 in
>     DISTRO_FEATURES
>   Remove argparse from requirements.txt of some modules
>
> Lei Maohui (3):
>   python-beautifulsoup4: upgrade 4.3.2 -> 4.4.0
>   python-sqlalchemy-migrate: upgrade 0.9.6->0.9.7
>   python-testtools: upgrade 0.9.33 -> 1.8.0
>
> Li xin (10):
>   python-setuptools-git: add native support
>   python-httpretty: upgrade 0.8.7 -> 0.8.10
>   python-jsonpatch: upgrade 1.9 -> 1.11
>   python-jsonpointer: upgrade 1.7 -> 1.9
>   python-msgpack: upgrade 0.4.5 -> 0.4.6
>   python-pecan: upgrade 0.8.3 -> 0.9.0
>   json: upgrade 1.8.1 -> 1.8.3
>   ruby.bbclass: Error fix
>   python-vcversioner: add new recipe
>   python-jsonschema: upgrade 2.4.0 -> 2.5.1
>
> Mark Asselstine (9):
>   python-nova: add missing dependency on sqlparse
>   meta-openstack: add wildcard to libvirt bbappend
>   libvirt: remove sanlock from PACKAGECONFIG
>   glance: add new dependencies
>   keystone: the 'sql' section is deprecated
>   python-testtools: fix build error
>   keystone: add missing functools32 module
>   django-pyscss: uprev to version 2.0.2
>   openvswitch: add as RRECOMMENDS for compute and controller
>
>  meta-openstack/classes/ruby.bbclass                |  1 +
>  ...up4_4.3.2.bb => python-beautifulsoup4_4.4.0.bb} |  6 ++--
>  .../python/python-ceilometer_git.bb                |  7 ++---
>  .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
>  .../python/python-cinderclient_git.bb              |  3 +-
>  ...1-Fix-object-has-no-attribute-debug-error.patch | 32
> ++++++++++++++++++++++
>  .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
>  .../recipes-devtools/python/python-cliff_1.10.0.bb |  6 ++--
>  ...scss_1.0.6.bb => python-django-pyscss_2.0.2.bb} |  6 ++--
>  .../recipes-devtools/python/python-enum_0.4.4.bb   | 25 +++++++++++++++++
>  ...ventlet_0.17.1.bb => python-eventlet_0.17.4.bb} |  5 ++--
>  .../python/python-functools32_3.2.3-2.bb           | 29
> ++++++++++++++++++++
>  .../recipes-devtools/python/python-glance_git.bb   |  3 ++
>  .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
>  .../python/python-glanceclient_git.bb              |  1 +
>  .../recipes-devtools/python/python-heat_git.bb     |  8 +++---
>  ...tpretty_0.8.7.bb => python-httpretty_0.8.10.bb} |  4 +--
>  ...n-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb} |  4 +--
>  ...sonpointer_1.7.bb => python-jsonpointer_1.9.bb} |  4 +--
>  ...nschema_2.4.0.bb => python-jsonschema_2.5.1.bb} |  6 ++--
>  .../python/python-keystone/keystone.conf           |  2 +-
>  .../recipes-devtools/python/python-keystone_git.bb |  1 +
>  .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
>  .../python/python-keystoneclient_git.bb            |  1 +
>  ...on-msgpack_0.4.5.bb => python-msgpack_0.4.6.bb} |  4 +--
>  .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
>  .../python/python-neutronclient_git.bb             |  3 +-
>  .../recipes-devtools/python/python-nova_git.bb     |  8 +++++-
>  .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
>  .../python/python-novaclient_git.bb                |  9 +++---
>  .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
>  .../python/python-oslo.config_1.9.3.bb             |  4 +--
>  .../python/python-oslo.versionedobjects_0.1.1.bb   | 26
> ++++++++++++++++++
>  .../python/python-pathlib_1.0.1.bb                 | 29
> ++++++++++++++++++++
>  .../{python-pbr_0.10.8.bb => python-pbr_0.11.0.bb} |  8 ++----
>  ...python-pecan_0.8.3.bb => python-pecan_0.9.0.bb} |  4 +--
>  .../recipes-devtools/python/python-pyscss_1.3.4.bb |  1 +
>  .../python/python-repoze.lru_0.6.bb                | 20 ++++++++++++++
>  .../python/python-routes_1.12.3.bb                 |  2 +-
>  .../python/python-semantic-version_2.4.2.bb        | 27
> ++++++++++++++++++
>  .../python/python-setuptools-git_1.1.bb            |  1 +
>  ...0.9.6.bb => python-sqlalchemy-migrate_0.9.7.bb} |  5 ++--
>  .../python/python-sqlparse_0.1.16.bb               | 27
> ++++++++++++++++++
>  .../Remove-argparse-from-requirements.txt.patch    | 23 ++++++++++++++++
>  .../python/python-stevedore_1.3.0.bb               |  2 ++
>  ...sttools_0.9.33.bb => python-testtools_1.8.0.bb} |  8 ++++--
>  .../python/python-vcversioner_2.14.0.0.bb          | 16 +++++++++++
>  .../ruby/json/0001-Dont-compile-extensions.patch   | 20 --------------
>  meta-openstack/recipes-devtools/ruby/json_git.bb   |  5 ++--
>  ...ibvirt_1.2.12.bbappend => libvirt_1.%.bbappend} |  2 +-
>  .../packagegroups/packagegroup-cloud-compute.bb    |  2 ++
>  .../packagegroups/packagegroup-cloud-controller.bb |  1 +
>  .../packagegroups/packagegroup-cloud-extras.bb     |  2 +-
>  .../recipes-kernel/linux/linux-yocto/nf.cfg        |  1 +
>  54 files changed, 510 insertions(+), 79 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{
> python-beautifulsoup4_4.3.2.bb => python-beautifulsoup4_4.4.0.bb} (71%)
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-cinderclient/Remove-argparse-from-requirements.txt.patch
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-cliff/0001-Fix-object-has-no-attribute-debug-error.patch
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-cliff/Remove-argparse-from-requirements.txt.patch
>  rename meta-openstack/recipes-devtools/python/{
> python-django-pyscss_1.0.6.bb => python-django-pyscss_2.0.2.bb} (77%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-enum_0.4.4.bb
>  rename meta-openstack/recipes-devtools/python/{python-eventlet_0.17.1.bb
> => python-eventlet_0.17.4.bb} (71%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-functools32_3.2.3-2.bb
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-glanceclient/Remove-argparse-from-requirements.txt.patch
>  rename meta-openstack/recipes-devtools/python/{python-httpretty_0.8.7.bb
> => python-httpretty_0.8.10.bb} (78%)
>  rename meta-openstack/recipes-devtools/python/{python-jsonpatch_1.9.bb
> => python-jsonpatch_1.11.bb} (77%)
>  rename meta-openstack/recipes-devtools/python/{python-jsonpointer_1.7.bb
> => python-jsonpointer_1.9.bb} (76%)
>  rename meta-openstack/recipes-devtools/python/{python-jsonschema_2.4.0.bb
> => python-jsonschema_2.5.1.bb} (70%)
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-keystoneclient/Remove-argparse-from-requirements.txt.patch
>  rename meta-openstack/recipes-devtools/python/{python-msgpack_0.4.5.bb
> => python-msgpack_0.4.6.bb} (74%)
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-neutronclient/Remove-argparse-from-requirements.txt.patch
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-novaclient/Remove-argparse-from-requirements.txt.patch
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-oslo.config/Remove-argparse-from-requirements.txt.patch
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-oslo.versionedobjects_0.1.1.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-pathlib_1.0.1.bb
>  rename meta-openstack/recipes-devtools/python/{python-pbr_0.10.8.bb =>
> python-pbr_0.11.0.bb} (73%)
>  rename meta-openstack/recipes-devtools/python/{python-pecan_0.8.3.bb =>
> python-pecan_0.9.0.bb} (80%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-repoze.lru_0.6.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-semantic-version_2.4.2.bb
>  rename meta-openstack/recipes-devtools/python/{
> python-sqlalchemy-migrate_0.9.6.bb => python-sqlalchemy-migrate_0.9.7.bb}
> (78%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-sqlparse_0.1.16.bb
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-stevedore/Remove-argparse-from-requirements.txt.patch
>  rename meta-openstack/recipes-devtools/python/{python-testtools_0.9.33.bb
> => python-testtools_1.8.0.bb} (72%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-vcversioner_2.14.0.0.bb
>  delete mode 100644
> meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
>  rename meta-openstack/recipes-extended/libvirt/{libvirt_1.2.12.bbappend
> => libvirt_1.%.bbappend} (93%)
>
> --
> 2.5.0
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

--001a11438eb2209e890526a27d4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Dec 8, 2015 at 12:33 PM, Josep Puigdemont <span dir=3D"ltr">&lt=
;<a href=3D"mailto:josep.puigdemont@enea.com" target=3D"_blank">josep.puigd=
emont@enea.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<=
br>
<br>
A few comments on this patch series:<br>
<br>
* It contains several cherry-picks from master that are also needed in<br>
fido-kilo.<br>
<br>
* I had to cherry-pick django-pyscss 2.0.2 from master, although Kilo&#39;s=
<br>
requirements have a cap on this package (&gt;=3D1.0.3,&lt;2.0.0), but horiz=
on<br>
wouldn&#39;t work otherwise.<br>
<br>
* There are also a few upgrades to Openstack Kilo 2015.1.2 that were missin=
g<br>
from the previous series (and a new recipe for oslo.versionedobjects).<br>
<br>
* Various dependencies have been added, and NAT as well as TUN kernel modul=
es<br>
are added to the compute image too.<br>
<br>
* The last pacth is the only one I think may be a bit controversial (becaus=
e<br>
it&#39;s rather ugly). Maybe you have some suggestions on how to solve the =
issue<br>
described in the commit message. I have put everything in one patch so it i=
s<br>
easy to remove later, or to discard altogether. Without this patch the imag=
es<br>
won&#39;t work out of the box, but it can be fixed by adding a simple sed c=
ommand<br>
to IMAGE_POSTPROCESS_COMMAND that does the same.<br>
<br>
<br>
I have tested this using both the AIO image and comupte+controller images<b=
r>
on qemu. Only the AIO image has been tested on real HW.<br>
<br>
I&#39;m sorry for the large patch sets! I believe this is the last series f=
or<br>
fido-kilo I have. I hope I can work with master and Liberty pretty soon.<br=
></blockquote><div><br><br></div><div>I&#39;ve merged the series to fido-ki=
lo, with the v2 class used for argparse fixups.<br><br></div><div>I also ch=
erry picked a modified version of the class to master, so we can start<br><=
/div><div>using it there for fixups as well.<br><br></div><div>Cheers,<br><=
br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
Thanks,<br>
<br>
/Josep<br>
<br>
Jackie Huang (8):<br>
=C2=A0 python-pathlib: add new recipe<br>
=C2=A0 python-django-pyscss: add missing rdepends on python-pathlib<br>
=C2=A0 python-enum: add new recipe<br>
=C2=A0 python-pyscss: add missing rdepends on python-enum<br>
=C2=A0 python-repoze.lru: add new recipe<br>
=C2=A0 python-routes: add rdepends on python-repoze.lru<br>
=C2=A0 python-nova: add missing rdepends<br>
=C2=A0 python-eventlet: upgrade 0.17.1 -&gt; 0.17.4<br>
<br>
Josep Puigdemont (12):<br>
=C2=A0 python-sqlalchemy-migrate: depends on sqlparse<br>
=C2=A0 python-cliff: Fix object has no attribute debug error<br>
=C2=A0 python-nova: dependency on blkid<br>
=C2=A0 yocto-kernel: enable NAT<br>
=C2=A0 python-pbr: upgrade to 0.11<br>
=C2=A0 python-novaclient: upgrade to 2.23.2<br>
=C2=A0 python-ceilometer: upgrade to 2015.1.2<br>
=C2=A0 python-oslo.versionedobjects: added recipe<br>
=C2=A0 python-heat: update to 2015.1.2<br>
=C2=A0 packagegroup-cloud-compute: add tun kernel module<br>
=C2=A0 packagegroup-cloud-extras: include xterm only if x11 in<br>
=C2=A0 =C2=A0 DISTRO_FEATURES<br>
=C2=A0 Remove argparse from requirements.txt of some modules<br>
<br>
Lei Maohui (3):<br>
=C2=A0 python-beautifulsoup4: upgrade 4.3.2 -&gt; 4.4.0<br>
=C2=A0 python-sqlalchemy-migrate: upgrade 0.9.6-&gt;0.9.7<br>
=C2=A0 python-testtools: upgrade 0.9.33 -&gt; 1.8.0<br>
<br>
Li xin (10):<br>
=C2=A0 python-setuptools-git: add native support<br>
=C2=A0 python-httpretty: upgrade 0.8.7 -&gt; 0.8.10<br>
=C2=A0 python-jsonpatch: upgrade 1.9 -&gt; 1.11<br>
=C2=A0 python-jsonpointer: upgrade 1.7 -&gt; 1.9<br>
=C2=A0 python-msgpack: upgrade 0.4.5 -&gt; 0.4.6<br>
=C2=A0 python-pecan: upgrade 0.8.3 -&gt; 0.9.0<br>
=C2=A0 json: upgrade 1.8.1 -&gt; 1.8.3<br>
=C2=A0 ruby.bbclass: Error fix<br>
=C2=A0 python-vcversioner: add new recipe<br>
=C2=A0 python-jsonschema: upgrade 2.4.0 -&gt; 2.5.1<br>
<br>
Mark Asselstine (9):<br>
=C2=A0 python-nova: add missing dependency on sqlparse<br>
=C2=A0 meta-openstack: add wildcard to libvirt bbappend<br>
=C2=A0 libvirt: remove sanlock from PACKAGECONFIG<br>
=C2=A0 glance: add new dependencies<br>
=C2=A0 keystone: the &#39;sql&#39; section is deprecated<br>
=C2=A0 python-testtools: fix build error<br>
=C2=A0 keystone: add missing functools32 module<br>
=C2=A0 django-pyscss: uprev to version 2.0.2<br>
=C2=A0 openvswitch: add as RRECOMMENDS for compute and controller<br>
<br>
=C2=A0meta-openstack/classes/ruby.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...<a href=3D"http://up4_4.3.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">up4_4.3.2.bb</a> =3D&gt; <a href=3D"http://python-beautifulsoup4_4.4.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python-beautifulsoup4_4.4.0.bb</a>}=
 |=C2=A0 6 ++--<br>
=C2=A0.../python/<a href=3D"http://python-ceilometer_git.bb" rel=3D"norefer=
rer" target=3D"_blank">python-ceilometer_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++---<br>
=C2=A0.../Remove-argparse-from-requirements.txt.patch=C2=A0 =C2=A0 | 25 +++=
++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-cinderclient_git.bb" rel=3D"noref=
errer" target=3D"_blank">python-cinderclient_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A0...1-Fix-object-has-no-attribute-debug-error.patch | 32 +++++++++++++=
+++++++++<br>
=C2=A0.../Remove-argparse-from-requirements.txt.patch=C2=A0 =C2=A0 | 25 +++=
++++++++++++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-cliff_1.10.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-cliff_1.10.0.bb</a> |=C2=A0 6 =
++--<br>
=C2=A0...<a href=3D"http://scss_1.0.6.bb" rel=3D"noreferrer" target=3D"_bla=
nk">scss_1.0.6.bb</a> =3D&gt; <a href=3D"http://python-django-pyscss_2.0.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python-django-pyscss_2.0.2.bb</a>}=
 |=C2=A0 6 ++--<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-enum_0.4.4.bb" r=
el=3D"noreferrer" target=3D"_blank">python-enum_0.4.4.bb</a>=C2=A0 =C2=A0| =
25 +++++++++++++++++<br>
=C2=A0...<a href=3D"http://ventlet_0.17.1.bb" rel=3D"noreferrer" target=3D"=
_blank">ventlet_0.17.1.bb</a> =3D&gt; <a href=3D"http://python-eventlet_0.1=
7.4.bb" rel=3D"noreferrer" target=3D"_blank">python-eventlet_0.17.4.bb</a>}=
 |=C2=A0 5 ++--<br>
=C2=A0.../python/<a href=3D"http://python-functools32_3.2.3-2.bb" rel=3D"no=
referrer" target=3D"_blank">python-functools32_3.2.3-2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++++++++++++++++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-glance_git.bb" r=
el=3D"noreferrer" target=3D"_blank">python-glance_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 3 ++<br>
=C2=A0.../Remove-argparse-from-requirements.txt.patch=C2=A0 =C2=A0 | 25 +++=
++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-glanceclient_git.bb" rel=3D"noref=
errer" target=3D"_blank">python-glanceclient_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-heat_git.bb" rel=
=3D"noreferrer" target=3D"_blank">python-heat_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +++---<br>
=C2=A0...<a href=3D"http://tpretty_0.8.7.bb" rel=3D"noreferrer" target=3D"_=
blank">tpretty_0.8.7.bb</a> =3D&gt; <a href=3D"http://python-httpretty_0.8.=
10.bb" rel=3D"noreferrer" target=3D"_blank">python-httpretty_0.8.10.bb</a>}=
 |=C2=A0 4 +--<br>
=C2=A0...<a href=3D"http://n-jsonpatch_1.9.bb" rel=3D"noreferrer" target=3D=
"_blank">n-jsonpatch_1.9.bb</a> =3D&gt; <a href=3D"http://python-jsonpatch_=
1.11.bb" rel=3D"noreferrer" target=3D"_blank">python-jsonpatch_1.11.bb</a>}=
 |=C2=A0 4 +--<br>
=C2=A0...<a href=3D"http://sonpointer_1.7.bb" rel=3D"noreferrer" target=3D"=
_blank">sonpointer_1.7.bb</a> =3D&gt; <a href=3D"http://python-jsonpointer_=
1.9.bb" rel=3D"noreferrer" target=3D"_blank">python-jsonpointer_1.9.bb</a>}=
 |=C2=A0 4 +--<br>
=C2=A0...<a href=3D"http://nschema_2.4.0.bb" rel=3D"noreferrer" target=3D"_=
blank">nschema_2.4.0.bb</a> =3D&gt; <a href=3D"http://python-jsonschema_2.5=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python-jsonschema_2.5.1.bb</a>}=
 |=C2=A0 6 ++--<br>
=C2=A0.../python/python-keystone/keystone.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-keystone_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-keystone_git.bb</a> |=C2=A0 1 =
+<br>
=C2=A0.../Remove-argparse-from-requirements.txt.patch=C2=A0 =C2=A0 | 25 +++=
++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-keystoneclient_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-keystoneclient_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...<a href=3D"http://on-msgpack_0.4.5.bb" rel=3D"noreferrer" target=
=3D"_blank">on-msgpack_0.4.5.bb</a> =3D&gt; <a href=3D"http://python-msgpac=
k_0.4.6.bb" rel=3D"noreferrer" target=3D"_blank">python-msgpack_0.4.6.bb</a=
>} |=C2=A0 4 +--<br>
=C2=A0.../Remove-argparse-from-requirements.txt.patch=C2=A0 =C2=A0 | 25 +++=
++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-neutronclient_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">python-neutronclient_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-nova_git.bb" rel=
=3D"noreferrer" target=3D"_blank">python-nova_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +++++-<br>
=C2=A0.../Remove-argparse-from-requirements.txt.patch=C2=A0 =C2=A0 | 25 +++=
++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-novaclient_git.bb" rel=3D"norefer=
rer" target=3D"_blank">python-novaclient_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++---<br>
=C2=A0.../Remove-argparse-from-requirements.txt.patch=C2=A0 =C2=A0 | 25 +++=
++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-oslo.config_1.9.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">python-oslo.config_1.9.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +--<br>
=C2=A0.../python/<a href=3D"http://python-oslo.versionedobjects_0.1.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python-oslo.versionedobjects_0.1.1.bb</=
a>=C2=A0 =C2=A0| 26 ++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-pathlib_1.0.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python-pathlib_1.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++++++++++++++++++<br>
=C2=A0.../{<a href=3D"http://python-pbr_0.10.8.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python-pbr_0.10.8.bb</a> =3D&gt; <a href=3D"http://python-pbr_=
0.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pbr_0.11.0.bb</a>} |=
=C2=A0 8 ++----<br>
=C2=A0...<a href=3D"http://python-pecan_0.8.3.bb" rel=3D"noreferrer" target=
=3D"_blank">python-pecan_0.8.3.bb</a> =3D&gt; <a href=3D"http://python-peca=
n_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pecan_0.9.0.bb</a>}=
 |=C2=A0 4 +--<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-pyscss_1.3.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-pyscss_1.3.4.bb</a> |=C2=A0 1 =
+<br>
=C2=A0.../python/<a href=3D"http://python-repoze.lru_0.6.bb" rel=3D"norefer=
rer" target=3D"_blank">python-repoze.lru_0.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 ++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-routes_1.12.3.bb" rel=3D"noreferr=
er" target=3D"_blank">python-routes_1.12.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../python/<a href=3D"http://python-semantic-version_2.4.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python-semantic-version_2.4.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 27 ++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-setuptools-git_1.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-setuptools-git_1.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...<a href=3D"http://0.9.6.bb" rel=3D"noreferrer" target=3D"_blank">0=
.9.6.bb</a> =3D&gt; <a href=3D"http://python-sqlalchemy-migrate_0.9.7.bb" r=
el=3D"noreferrer" target=3D"_blank">python-sqlalchemy-migrate_0.9.7.bb</a>}=
 |=C2=A0 5 ++--<br>
=C2=A0.../python/<a href=3D"http://python-sqlparse_0.1.16.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-sqlparse_0.1.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 ++++++++++++++++++<br>
=C2=A0.../Remove-argparse-from-requirements.txt.patch=C2=A0 =C2=A0 | 23 +++=
+++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-stevedore_1.3.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-stevedore_1.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0...<a href=3D"http://sttools_0.9.33.bb" rel=3D"noreferrer" target=3D"=
_blank">sttools_0.9.33.bb</a> =3D&gt; <a href=3D"http://python-testtools_1.=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-testtools_1.8.0.bb</a>}=
 |=C2=A0 8 ++++--<br>
=C2=A0.../python/<a href=3D"http://python-vcversioner_2.14.0.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python-vcversioner_2.14.0.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 16 +++++++++++<br>
=C2=A0.../ruby/json/0001-Dont-compile-extensions.patch=C2=A0 =C2=A0| 20 ---=
-----------<br>
=C2=A0meta-openstack/recipes-devtools/ruby/<a href=3D"http://json_git.bb" r=
el=3D"noreferrer" target=3D"_blank">json_git.bb</a>=C2=A0 =C2=A0|=C2=A0 5 +=
+--<br>
=C2=A0...ibvirt_1.2.12.bbappend =3D&gt; libvirt_1.%.bbappend} |=C2=A0 2 +-<=
br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-cloud-compute.bb" re=
l=3D"noreferrer" target=3D"_blank">packagegroup-cloud-compute.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 2 ++<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-cloud-controller.bb"=
 rel=3D"noreferrer" target=3D"_blank">packagegroup-cloud-controller.bb</a> =
|=C2=A0 1 +<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-cloud-extras.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-cloud-extras.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../recipes-kernel/linux/linux-yocto/nf.cfg=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
=C2=A054 files changed, 510 insertions(+), 79 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-beautifulsoup4_4.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python-bea=
utifulsoup4_4.3.2.bb</a> =3D&gt; <a href=3D"http://python-beautifulsoup4_4.=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-beautifulsoup4_4.4.0.bb=
</a>} (71%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-cind=
erclient/Remove-argparse-from-requirements.txt.patch<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-clif=
f/0001-Fix-object-has-no-attribute-debug-error.patch<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-clif=
f/Remove-argparse-from-requirements.txt.patch<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-django-pyscss_1.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python-djan=
go-pyscss_1.0.6.bb</a> =3D&gt; <a href=3D"http://python-django-pyscss_2.0.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python-django-pyscss_2.0.2.bb</a>=
} (77%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-enum_0.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python-en=
um_0.4.4.bb</a><br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-eventlet_0.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-eventlet=
_0.17.1.bb</a> =3D&gt; <a href=3D"http://python-eventlet_0.17.4.bb" rel=3D"=
noreferrer" target=3D"_blank">python-eventlet_0.17.4.bb</a>} (71%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-functools32_3.2.3-2.bb" rel=3D"noreferrer" target=3D"_blank">=
python-functools32_3.2.3-2.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-glan=
ceclient/Remove-argparse-from-requirements.txt.patch<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-httpretty_0.8.7.bb" rel=3D"noreferrer" target=3D"_blank">python-httprett=
y_0.8.7.bb</a> =3D&gt; <a href=3D"http://python-httpretty_0.8.10.bb" rel=3D=
"noreferrer" target=3D"_blank">python-httpretty_0.8.10.bb</a>} (78%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-jsonpatch_1.9.bb" rel=3D"noreferrer" target=3D"_blank">python-jsonpatch_=
1.9.bb</a> =3D&gt; <a href=3D"http://python-jsonpatch_1.11.bb" rel=3D"noref=
errer" target=3D"_blank">python-jsonpatch_1.11.bb</a>} (77%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-jsonpointer_1.7.bb" rel=3D"noreferrer" target=3D"_blank">python-jsonpoin=
ter_1.7.bb</a> =3D&gt; <a href=3D"http://python-jsonpointer_1.9.bb" rel=3D"=
noreferrer" target=3D"_blank">python-jsonpointer_1.9.bb</a>} (76%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-jsonschema_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-jsonsch=
ema_2.4.0.bb</a> =3D&gt; <a href=3D"http://python-jsonschema_2.5.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python-jsonschema_2.5.1.bb</a>} (70%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-keys=
toneclient/Remove-argparse-from-requirements.txt.patch<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-msgpack_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python-msgpack_0.=
4.5.bb</a> =3D&gt; <a href=3D"http://python-msgpack_0.4.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-msgpack_0.4.6.bb</a>} (74%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-neut=
ronclient/Remove-argparse-from-requirements.txt.patch<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-nova=
client/Remove-argparse-from-requirements.txt.patch<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-oslo=
.config/Remove-argparse-from-requirements.txt.patch<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-oslo.versionedobjects_0.1.1.bb" rel=3D"noreferrer" target=3D"=
_blank">python-oslo.versionedobjects_0.1.1.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-pathlib_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
-pathlib_1.0.1.bb</a><br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-pbr_0.10.8.bb" rel=3D"noreferrer" target=3D"_blank">python-pbr_0.10.8.bb=
</a> =3D&gt; <a href=3D"http://python-pbr_0.11.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python-pbr_0.11.0.bb</a>} (73%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-pecan_0.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python-pecan_0.8.3.=
bb</a> =3D&gt; <a href=3D"http://python-pecan_0.9.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python-pecan_0.9.0.bb</a>} (80%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-repoze.lru_0.6.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-repoze.lru_0.6.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-semantic-version_2.4.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">python-semantic-version_2.4.2.bb</a><br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-sqlalchemy-migrate_0.9.6.bb" rel=3D"noreferrer" target=3D"_blank">python=
-sqlalchemy-migrate_0.9.6.bb</a> =3D&gt; <a href=3D"http://python-sqlalchem=
y-migrate_0.9.7.bb" rel=3D"noreferrer" target=3D"_blank">python-sqlalchemy-=
migrate_0.9.7.bb</a>} (78%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-sqlparse_0.1.16.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on-sqlparse_0.1.16.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-stev=
edore/Remove-argparse-from-requirements.txt.patch<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-testtools_0.9.33.bb" rel=3D"noreferrer" target=3D"_blank">python-testtoo=
ls_0.9.33.bb</a> =3D&gt; <a href=3D"http://python-testtools_1.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python-testtools_1.8.0.bb</a>} (72%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-vcversioner_2.14.0.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>python-vcversioner_2.14.0.0.bb</a><br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/ruby/json/0001-Don=
t-compile-extensions.patch<br>
=C2=A0rename meta-openstack/recipes-extended/libvirt/{libvirt_1.2.12.bbappe=
nd =3D&gt; libvirt_1.%.bbappend} (93%)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.5.0<br>
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

--001a11438eb2209e890526a27d4c--
