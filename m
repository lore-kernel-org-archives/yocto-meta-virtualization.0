Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1AA3E006F3; Mon,  7 Dec 2015 07:56:03 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5409DE00349
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Dec 2015 07:55:59 -0800 (PST)
Received: by vkay187 with SMTP id y187so104642414vka.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Dec 2015 07:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hpinrHiIQ+XrTlTH5agj2KulPnEmJMgLehhUZLp/kMk=;
	b=eoRnZQ0el7U3uTn1ZICYv22Ta+B4IyOVtfc+5Yh6Vhq3KS3gjvHxCpVYVixf4L3zFN
	Fi0LmcPydnemsbAbh4KiWT78vIfDeGwZQ6QzPoZRrpkYAsSTcOW+tB+ntPKD3bsvL7I5
	n2Yn048kJ8JE1eVOZEtmeUbVVvuwmw1y3vrKTNrMdc/n3GzPJpAXl1mj9883+BuvurtX
	K37s2BehSaA+b87q9eiBa1nEVAEnfLGNMn5B1fe7ixDixWRpOJONKdlCZ4ZGiN9vPuid
	BfAf1FMPYYcT1ZlZQAkBSUp467XMhg2jnGpMpRaFfiwm2wNbJnp6Ics+ng0UdtaQ0OhS
	zejA==
MIME-Version: 1.0
X-Received: by 10.31.192.12 with SMTP id q12mr5666376vkf.96.1449503759289;
	Mon, 07 Dec 2015 07:55:59 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 7 Dec 2015 07:55:59 -0800 (PST)
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
Date: Mon, 7 Dec 2015 10:55:59 -0500
Message-ID: <CADkTA4MFxputkKQQMj2a6VymbRq8T4OZ=4LfaxsWqiH-B5uo_Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 00/40] upgrade to Kilo 2015.1.2
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
X-List-Received-Date: Mon, 07 Dec 2015 15:56:04 -0000
Content-Type: multipart/alternative; boundary=001a11439426ac5189052650e433

--001a11439426ac5189052650e433
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 2, 2015 at 11:32 AM, Josep Puigdemont <josep.puigdemont@enea.com
> wrote:

> This series of patches are an upgrade to the latest Kilo release of
> Openstack (2015.1.2).
>
> python-wsme had the wrong license.
>
> There are a couple of cherry-picks from master too.
>
> layer.conf has been modified to select the required version of the
> recipes python-six (1.9.0) and python-psutil (1.2.1).
>
> Dependency on python-lockfile and python-lesscpy has been removed, as
> Openstack is not using them anymore. The recipes have been removed too, but
> this is put in a separate commit, in case you want to preserve them.
>

I went ahead and merged the series as-is, complete with the removal of the
unnecessary packages. Part of what I insist about meta-cloud-services, is
that
it isn't just a collection of packages, but more a set of components that do
something, and that are all used.

So if we don't use them any more, then they aren't tested by system level
use
cases .. and I can drop them.

If I'm proven wrong, they are just a revert away!

Bruce


>
> This is part of a larger patch set to bring fido-kilo to a more functional
> state.
>
> Jackie Huang (1):
>   python-xstatic-angular-irdragndrop: add new recipe
>
> Josep Puigdemont (38):
>   python-tooz: updated to 0.13.3 (kilo latest)
>   python-wsme: upgrade to 0.8.0, set proper license
>   python-pycadf: upgrade to 0.8.0 (kilo)
>   layer.conf: prefer python-six 1.9.0
>   python-stevedore: upgrade to 1.3.0 (kilo)
>   python-oslo.config: upgrade to 1.9.3 (kilo)
>   python-oslo.i18n: upgrade to 1.5.0 (kilo)
>   python-oslo.utils: update to 1.4.0, add dependencies
>   python-oslo.concurrency: updated to 1.8.2 (kilo)
>   python-oslo.context: upgrade to 0.2.0 (kilo)
>   python-oslo.db: upgrade to 1.7.2 (kilo)
>   python-wrapt: add recipe
>   python-debtcollector: add recipe
>   python-oslo.log: update to 1.0.0, add dependencies
>   python-oslo.serialization: upgrade to 1.4.0
>   python-oslo.middleware: upgrade to 1.0.0
>   python-trollius: add recipe
>   python-aioeventlet: add recipe
>   python-oslo.messaging: upgrade to 1.8.3
>   python-oslo.rootwrap: upgrade to 1.6.0
>   python-psutil: add recipe
>   layer.conf: prefer 1.2.1 version of python-psutil
>   python-cinderclient: upgrade to 1.1.2
>   python-glanceclient: upgrade to 0.17.3
>   python-jsonrpclib: add recipe
>   python-keystonemiddleware: upgrade to 1.5.2
>   python-nova: upgrade to 2015.1.2
>   python-neutron: upgrade to 2015.1.2
>   neutron ml2 plugin: enable gre in [agent] section
>   python-cryptography,-vectors: add 0.8.1
>   python-oslo.policy: add new recipe
>   python-keystone: upgrade to 2015.1.2
>   python-keystoneclient: upgrade to 1.3.3
>   python-horizon: upgrade to 2015.1.2
>   python-horizon: remove dependency on lesscpy
>   python-lesscpy: remove recipe
>   Openstack doesn't depend on lockfile anymore
>   python-lockfile: remove recipe
>
> Mark Asselstine (1):
>   horizon: add missing dependencies to address startup errors
>
>  meta-openstack/conf/layer.conf                     |  2 +
>  .../python/python-aioeventlet_0.4.bb               | 14 +++++++
>  .../python/python-ceilometer_git.bb                |  1 -
>  .../recipes-devtools/python/python-cinder_git.bb   |  1 -
>  .../python/python-cinderclient_git.bb              |  7 ++--
>  .../python/python-cryptography-vectors_0.8.1.bb    | 14 +++++++
>  .../python/python-cryptography/run-ptest           |  2 +
>  .../python/python-cryptography_0.8.1.bb            | 46
> ++++++++++++++++++++++
>  .../python/python-debtcollector_0.3.0.bb           | 22 +++++++++++
>  .../python/python-glanceclient_git.bb              | 18 ++++-----
>  .../recipes-devtools/python/python-heat_git.bb     |  1 -
>  .../recipes-devtools/python/python-horizon_git.bb  | 13 +++---
>  .../python/python-jsonrpclib_0.1.6.bb              | 11 ++++++
>  .../recipes-devtools/python/python-keystone_git.bb |  9 +++--
>  .../python/python-keystoneclient_git.bb            |  8 ++--
>  .../python/python-keystonemiddleware_git.bb        |  7 ++--
>  .../0001-lesscpy-remove-explicit-python3.patch     | 23 -----------
>  ...02-Description-Fixup-for-python3.3-compat.patch | 31 ---------------
>  .../recipes-devtools/python/python-lesscpy_0.9j.bb | 28 -------------
>  .../python/python-lockfile_0.9.1.bb                | 17 --------
>  .../recipes-devtools/python/python-neutron_git.bb  | 13 +++---
>  .../recipes-devtools/python/python-nova_git.bb     |  9 +++--
>  ...y_1.5.0.bb => python-oslo.concurrency_1.8.2.bb} | 14 +++++--
>  ...config_1.6.1.bb => python-oslo.config_1.9.3.bb} |  4 +-
>  .../python/python-oslo.context_git.bb              |  9 ++---
>  ...on-oslo.db_1.5.0.bb => python-oslo.db_1.7.2.bb} |  7 +---
>  ...slo.i18n_1.4.0.bb => python-oslo.i18n_1.5.0.bb} |  5 ++-
>  .../recipes-devtools/python/python-oslo.log_git.bb | 11 +++---
>  .../python/python-oslo.messaging_git.bb            | 23 +++++++----
>  ...re_0.4.0.bb => python-oslo.middleware_1.0.0.bb} | 16 ++++----
>  .../python/python-oslo.policy_0.3.2.bb             | 29 ++++++++++++++
>  ...wrap_1.5.0.bb => python-oslo.rootwrap_1.6.0.bb} |  7 ++--
>  .../python/python-oslo.serialization_git.bb        | 11 ++++--
>  .../python/python-oslo.utils_git.bb                | 12 ++++--
>  .../recipes-devtools/python/python-psutil_1.2.1.bb | 16 ++++++++
>  ...thon-pycadf_0.6.0.bb => python-pycadf_0.8.0.bb} |  6 +--
>  ...tevedore_1.2.0.bb => python-stevedore_1.3.0.bb} | 13 ++----
>  .../{python-tooz_0.4.bb => python-tooz_0.13.3.bb}  |  6 +--
>  .../recipes-devtools/python/python-trollius_2.0.bb | 10 +++++
>  .../recipes-devtools/python/python-wrapt_1.10.5.bb | 11 ++++++
>  .../{python-wsme_0.6.bb => python-wsme_0.8.0.bb}   | 14 ++++---
>  .../python-xstatic-angular-irdragndrop_1.0.2.2.bb  | 22 +++++++++++
>  .../python-xstatic-angular-lrdragndrop_1.0.2.2.bb  | 22 +++++++++++
>  .../python/python-xstatic-magic-search_0.2.5.1.bb  | 21 ++++++++++
>  44 files changed, 366 insertions(+), 220 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-aioeventlet_0.4.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-cryptography-vectors_0.8.1.bb
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-cryptography/run-ptest
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-cryptography_0.8.1.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-debtcollector_0.3.0.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-jsonrpclib_0.1.6.bb
>  delete mode 100644
> meta-openstack/recipes-devtools/python/python-lesscpy/0001-lesscpy-remove-explicit-python3.patch
>  delete mode 100644
> meta-openstack/recipes-devtools/python/python-lesscpy/0002-Description-Fixup-for-python3.3-compat.patch
>  delete mode 100644 meta-openstack/recipes-devtools/python/
> python-lesscpy_0.9j.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/
> python-lockfile_0.9.1.bb
>  rename meta-openstack/recipes-devtools/python/{
> python-oslo.concurrency_1.5.0.bb => python-oslo.concurrency_1.8.2.bb}
> (61%)
>  rename meta-openstack/recipes-devtools/python/{
> python-oslo.config_1.6.1.bb => python-oslo.config_1.9.3.bb} (79%)
>  rename meta-openstack/recipes-devtools/python/{python-oslo.db_1.5.0.bb
> => python-oslo.db_1.7.2.bb} (78%)
>  rename meta-openstack/recipes-devtools/python/{python-oslo.i18n_1.4.0.bb
> => python-oslo.i18n_1.5.0.bb} (77%)
>  rename meta-openstack/recipes-devtools/python/{
> python-oslo.middleware_0.4.0.bb => python-oslo.middleware_1.0.0.bb} (60%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-oslo.policy_0.3.2.bb
>  rename meta-openstack/recipes-devtools/python/{
> python-oslo.rootwrap_1.5.0.bb => python-oslo.rootwrap_1.6.0.bb} (76%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-psutil_1.2.1.bb
>  rename meta-openstack/recipes-devtools/python/{python-pycadf_0.6.0.bb =>
> python-pycadf_0.8.0.bb} (81%)
>  rename meta-openstack/recipes-devtools/python/{python-stevedore_1.2.0.bb
> => python-stevedore_1.3.0.bb} (53%)
>  rename meta-openstack/recipes-devtools/python/{python-tooz_0.4.bb =>
> python-tooz_0.13.3.bb} (81%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-trollius_2.0.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-wrapt_1.10.5.bb
>  rename meta-openstack/recipes-devtools/python/{python-wsme_0.6.bb =>
> python-wsme_0.8.0.bb} (56%)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-xstatic-angular-irdragndrop_1.0.2.2.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-xstatic-angular-lrdragndrop_1.0.2.2.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-xstatic-magic-search_0.2.5.1.bb
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

--001a11439426ac5189052650e433
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Dec 2, 2015 at 11:32 AM, Josep Puigdemont <span dir=3D"ltr">&lt=
;<a href=3D"mailto:josep.puigdemont@enea.com" target=3D"_blank">josep.puigd=
emont@enea.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This=
 series of patches are an upgrade to the latest Kilo release of<br>
Openstack (2015.1.2).<br>
<br>
python-wsme had the wrong license.<br>
<br>
There are a couple of cherry-picks from master too.<br>
<br>
layer.conf has been modified to select the required version of the<br>
recipes python-six (1.9.0) and python-psutil (1.2.1).<br>
<br>
Dependency on python-lockfile and python-lesscpy has been removed, as<br>
Openstack is not using them anymore. The recipes have been removed too, but=
<br>
this is put in a separate commit, in case you want to preserve them.<br></b=
lockquote><div><br></div><div>I went ahead and merged the series as-is, com=
plete with the removal of the<br></div><div>unnecessary packages. Part of w=
hat I insist about meta-cloud-services, is that<br></div><div>it isn&#39;t =
just a collection of packages, but more a set of components that do<br></di=
v><div>something, and that are all used.<br><br></div><div>So if we don&#39=
;t use them any more, then they aren&#39;t tested by system level use<br></=
div><div>cases .. and I can drop them.<br><br></div><div>If I&#39;m proven =
wrong, they are just a revert away!<br><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
This is part of a larger patch set to bring fido-kilo to a more functional<=
br>
state.<br>
<br>
Jackie Huang (1):<br>
=C2=A0 python-xstatic-angular-irdragndrop: add new recipe<br>
<br>
Josep Puigdemont (38):<br>
=C2=A0 python-tooz: updated to 0.13.3 (kilo latest)<br>
=C2=A0 python-wsme: upgrade to 0.8.0, set proper license<br>
=C2=A0 python-pycadf: upgrade to 0.8.0 (kilo)<br>
=C2=A0 layer.conf: prefer python-six 1.9.0<br>
=C2=A0 python-stevedore: upgrade to 1.3.0 (kilo)<br>
=C2=A0 python-oslo.config: upgrade to 1.9.3 (kilo)<br>
=C2=A0 python-oslo.i18n: upgrade to 1.5.0 (kilo)<br>
=C2=A0 python-oslo.utils: update to 1.4.0, add dependencies<br>
=C2=A0 python-oslo.concurrency: updated to 1.8.2 (kilo)<br>
=C2=A0 python-oslo.context: upgrade to 0.2.0 (kilo)<br>
=C2=A0 python-oslo.db: upgrade to 1.7.2 (kilo)<br>
=C2=A0 python-wrapt: add recipe<br>
=C2=A0 python-debtcollector: add recipe<br>
=C2=A0 python-oslo.log: update to 1.0.0, add dependencies<br>
=C2=A0 python-oslo.serialization: upgrade to 1.4.0<br>
=C2=A0 python-oslo.middleware: upgrade to 1.0.0<br>
=C2=A0 python-trollius: add recipe<br>
=C2=A0 python-aioeventlet: add recipe<br>
=C2=A0 python-oslo.messaging: upgrade to 1.8.3<br>
=C2=A0 python-oslo.rootwrap: upgrade to 1.6.0<br>
=C2=A0 python-psutil: add recipe<br>
=C2=A0 layer.conf: prefer 1.2.1 version of python-psutil<br>
=C2=A0 python-cinderclient: upgrade to 1.1.2<br>
=C2=A0 python-glanceclient: upgrade to 0.17.3<br>
=C2=A0 python-jsonrpclib: add recipe<br>
=C2=A0 python-keystonemiddleware: upgrade to 1.5.2<br>
=C2=A0 python-nova: upgrade to 2015.1.2<br>
=C2=A0 python-neutron: upgrade to 2015.1.2<br>
=C2=A0 neutron ml2 plugin: enable gre in [agent] section<br>
=C2=A0 python-cryptography,-vectors: add 0.8.1<br>
=C2=A0 python-oslo.policy: add new recipe<br>
=C2=A0 python-keystone: upgrade to 2015.1.2<br>
=C2=A0 python-keystoneclient: upgrade to 1.3.3<br>
=C2=A0 python-horizon: upgrade to 2015.1.2<br>
=C2=A0 python-horizon: remove dependency on lesscpy<br>
=C2=A0 python-lesscpy: remove recipe<br>
=C2=A0 Openstack doesn&#39;t depend on lockfile anymore<br>
=C2=A0 python-lockfile: remove recipe<br>
<br>
Mark Asselstine (1):<br>
=C2=A0 horizon: add missing dependencies to address startup errors<br>
<br>
=C2=A0meta-openstack/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0.../python/<a href=3D"http://python-aioeventlet_0.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-aioeventlet_0.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++++<br>
=C2=A0.../python/<a href=3D"http://python-ceilometer_git.bb" rel=3D"norefer=
rer" target=3D"_blank">python-ceilometer_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-cinder_git.bb" r=
el=3D"noreferrer" target=3D"_blank">python-cinder_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 1 -<br>
=C2=A0.../python/<a href=3D"http://python-cinderclient_git.bb" rel=3D"noref=
errer" target=3D"_blank">python-cinderclient_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++--<br>
=C2=A0.../python/<a href=3D"http://python-cryptography-vectors_0.8.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python-cryptography-vectors_0.8.1.bb</a>=
=C2=A0 =C2=A0 | 14 +++++++<br>
=C2=A0.../python/python-cryptography/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0.../python/<a href=3D"http://python-cryptography_0.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-cryptography_0.8.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 46 ++++++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-debtcollector_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">python-debtcollector_0.3.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-glanceclient_git.bb" rel=3D"noref=
errer" target=3D"_blank">python-glanceclient_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 ++++-----<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-heat_git.bb" rel=
=3D"noreferrer" target=3D"_blank">python-heat_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 -<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-horizon_git.bb" =
rel=3D"noreferrer" target=3D"_blank">python-horizon_git.bb</a>=C2=A0 | 13 +=
++---<br>
=C2=A0.../python/<a href=3D"http://python-jsonrpclib_0.1.6.bb" rel=3D"noref=
errer" target=3D"_blank">python-jsonrpclib_0.1.6.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-keystone_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-keystone_git.bb</a> |=C2=A0 9 =
+++--<br>
=C2=A0.../python/<a href=3D"http://python-keystoneclient_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-keystoneclient_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++--<br>
=C2=A0.../python/<a href=3D"http://python-keystonemiddleware_git.bb" rel=3D=
"noreferrer" target=3D"_blank">python-keystonemiddleware_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++--<br>
=C2=A0.../0001-lesscpy-remove-explicit-python3.patch=C2=A0 =C2=A0 =C2=A0| 2=
3 -----------<br>
=C2=A0...02-Description-Fixup-for-python3.3-compat.patch | 31 -------------=
--<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-lesscpy_0.9j.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-lesscpy_0.9j.bb</a> | 28 -----=
--------<br>
=C2=A0.../python/<a href=3D"http://python-lockfile_0.9.1.bb" rel=3D"norefer=
rer" target=3D"_blank">python-lockfile_0.9.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 --------<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-neutron_git.bb" =
rel=3D"noreferrer" target=3D"_blank">python-neutron_git.bb</a>=C2=A0 | 13 +=
++---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-nova_git.bb" rel=
=3D"noreferrer" target=3D"_blank">python-nova_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 +++--<br>
=C2=A0...<a href=3D"http://y_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>y_1.5.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.concurrency_1.8.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-oslo.concurrency_1.8.2.bb</a>}=
 | 14 +++++--<br>
=C2=A0...<a href=3D"http://config_1.6.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">config_1.6.1.bb</a> =3D&gt; <a href=3D"http://python-oslo.config_1.9.=
3.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.config_1.9.3.bb</a>}=
 |=C2=A0 4 +-<br>
=C2=A0.../python/<a href=3D"http://python-oslo.context_git.bb" rel=3D"noref=
errer" target=3D"_blank">python-oslo.context_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++---<br>
=C2=A0...<a href=3D"http://on-oslo.db_1.5.0.bb" rel=3D"noreferrer" target=
=3D"_blank">on-oslo.db_1.5.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.d=
b_1.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.db_1.7.2.bb</a=
>} |=C2=A0 7 +---<br>
=C2=A0...<a href=3D"http://slo.i18n_1.4.0.bb" rel=3D"noreferrer" target=3D"=
_blank">slo.i18n_1.4.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.i18n_1.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.i18n_1.5.0.bb</a>}=
 |=C2=A0 5 ++-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-oslo.log_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-oslo.log_git.bb</a> | 11 +++--=
-<br>
=C2=A0.../python/<a href=3D"http://python-oslo.messaging_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-oslo.messaging_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++++----<br>
=C2=A0...<a href=3D"http://re_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank=
">re_0.4.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.middleware_1.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python-oslo.middleware_1.0.0.bb</a>}=
 | 16 ++++----<br>
=C2=A0.../python/<a href=3D"http://python-oslo.policy_0.3.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">python-oslo.policy_0.3.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++++++++++++<br>
=C2=A0...<a href=3D"http://wrap_1.5.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">wrap_1.5.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.rootwrap_1.6.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.rootwrap_1.6.0.bb</a>}=
 |=C2=A0 7 ++--<br>
=C2=A0.../python/<a href=3D"http://python-oslo.serialization_git.bb" rel=3D=
"noreferrer" target=3D"_blank">python-oslo.serialization_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 11 ++++--<br>
=C2=A0.../python/<a href=3D"http://python-oslo.utils_git.bb" rel=3D"norefer=
rer" target=3D"_blank">python-oslo.utils_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++--<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-psutil_1.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-psutil_1.2.1.bb</a> | 16 +++++=
+++<br>
=C2=A0...<a href=3D"http://thon-pycadf_0.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">thon-pycadf_0.6.0.bb</a> =3D&gt; <a href=3D"http://python-pycad=
f_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pycadf_0.8.0.bb</a>=
} |=C2=A0 6 +--<br>
=C2=A0...<a href=3D"http://tevedore_1.2.0.bb" rel=3D"noreferrer" target=3D"=
_blank">tevedore_1.2.0.bb</a> =3D&gt; <a href=3D"http://python-stevedore_1.=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-stevedore_1.3.0.bb</a>}=
 | 13 ++----<br>
=C2=A0.../{<a href=3D"http://python-tooz_0.4.bb" rel=3D"noreferrer" target=
=3D"_blank">python-tooz_0.4.bb</a> =3D&gt; <a href=3D"http://python-tooz_0.=
13.3.bb" rel=3D"noreferrer" target=3D"_blank">python-tooz_0.13.3.bb</a>}=C2=
=A0 |=C2=A0 6 +--<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-trollius_2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-trollius_2.0.bb</a> | 10 +++++=
<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-wrapt_1.10.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-wrapt_1.10.5.bb</a> | 11 +++++=
+<br>
=C2=A0.../{<a href=3D"http://python-wsme_0.6.bb" rel=3D"noreferrer" target=
=3D"_blank">python-wsme_0.6.bb</a> =3D&gt; <a href=3D"http://python-wsme_0.=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.8.0.bb</a>}=C2=
=A0 =C2=A0| 14 ++++---<br>
=C2=A0.../<a href=3D"http://python-xstatic-angular-irdragndrop_1.0.2.2.bb" =
rel=3D"noreferrer" target=3D"_blank">python-xstatic-angular-irdragndrop_1.0=
.2.2.bb</a>=C2=A0 | 22 +++++++++++<br>
=C2=A0.../<a href=3D"http://python-xstatic-angular-lrdragndrop_1.0.2.2.bb" =
rel=3D"noreferrer" target=3D"_blank">python-xstatic-angular-lrdragndrop_1.0=
.2.2.bb</a>=C2=A0 | 22 +++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-xstatic-magic-search_0.2.5.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python-xstatic-magic-search_0.2.5.1.bb=
</a>=C2=A0 | 21 ++++++++++<br>
=C2=A044 files changed, 366 insertions(+), 220 deletions(-)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-aioeventlet_0.4.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on-aioeventlet_0.4.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-cryptography-vectors_0.8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">python-cryptography-vectors_0.8.1.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-cryp=
tography/run-ptest<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-cryptography_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-cryptography_0.8.1.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-debtcollector_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python-debtcollector_0.3.0.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-jsonrpclib_0.1.6.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-jsonrpclib_0.1.6.bb</a><br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/python-less=
cpy/0001-lesscpy-remove-explicit-python3.patch<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/python-less=
cpy/0002-Description-Fixup-for-python3.3-compat.patch<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-lesscpy_0.9j.bb" rel=3D"noreferrer" target=3D"_blank">python-=
lesscpy_0.9j.bb</a><br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-lockfile_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-lockfile_0.9.1.bb</a><br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-oslo.concurrency_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-o=
slo.concurrency_1.5.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.concurre=
ncy_1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.concurrency_=
1.8.2.bb</a>} (61%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-oslo.config_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.c=
onfig_1.6.1.bb</a> =3D&gt; <a href=3D"http://python-oslo.config_1.9.3.bb" r=
el=3D"noreferrer" target=3D"_blank">python-oslo.config_1.9.3.bb</a>} (79%)<=
br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-oslo.db_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.db_1.=
5.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.db_1.7.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-oslo.db_1.7.2.bb</a>} (78%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-oslo.i18n_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.i18=
n_1.4.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.i18n_1.5.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python-oslo.i18n_1.5.0.bb</a>} (77%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-oslo.middleware_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-os=
lo.middleware_0.4.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.middleware=
_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.middleware_1.0.=
0.bb</a>} (60%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-oslo.policy_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon-oslo.policy_0.3.2.bb</a><br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-oslo.rootwrap_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo=
.rootwrap_1.5.0.bb</a> =3D&gt; <a href=3D"http://python-oslo.rootwrap_1.6.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.rootwrap_1.6.0.bb</a>=
} (76%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-psutil_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-=
psutil_1.2.1.bb</a><br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-pycadf_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pycadf_0.6.=
0.bb</a> =3D&gt; <a href=3D"http://python-pycadf_0.8.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python-pycadf_0.8.0.bb</a>} (81%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-stevedore_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python-stevedor=
e_1.2.0.bb</a> =3D&gt; <a href=3D"http://python-stevedore_1.3.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python-stevedore_1.3.0.bb</a>} (53%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-tooz_0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-tooz_0.4.bb</a>=
 =3D&gt; <a href=3D"http://python-tooz_0.13.3.bb" rel=3D"noreferrer" target=
=3D"_blank">python-tooz_0.13.3.bb</a>} (81%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-trollius_2.0.bb" rel=3D"noreferrer" target=3D"_blank">python-=
trollius_2.0.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-wrapt_1.10.5.bb" rel=3D"noreferrer" target=3D"_blank">python-=
wrapt_1.10.5.bb</a><br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-wsme_0.6.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.6.bb</a>=
 =3D&gt; <a href=3D"http://python-wsme_0.8.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python-wsme_0.8.0.bb</a>} (56%)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-xstatic-angular-irdragndrop_1.0.2.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python-xstatic-angular-irdragndrop_1.0.2.2.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-xstatic-angular-lrdragndrop_1.0.2.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python-xstatic-angular-lrdragndrop_1.0.2.2.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-xstatic-magic-search_0.2.5.1.bb" rel=3D"noreferrer" target=3D=
"_blank">python-xstatic-magic-search_0.2.5.1.bb</a><br>
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

--001a11439426ac5189052650e433--
