Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A4B4E00CB0; Sat,  2 Feb 2019 19:48:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D98E9E00B92
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Feb 2019 19:48:01 -0800 (PST)
Received: by mail-lf1-f67.google.com with SMTP id v195so3526546lfa.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Feb 2019 19:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PgXFo+uKVxhNWxHLVTJ/LlMvM+/dkU1HhmFAuMgmxUs=;
	b=qYONRrxqJAQCh60MnnmuTpeRoCRwQwN/DdqUxYt06L7cyBRVUdet2RIHzNXeNftizK
	0uWZJY02aV0M5xSNOYSRzz2MqFBBiiWra6Y+ZNmnE8AK336JkwFeZDBmZwD4Lem4KLiy
	8S4rvZI1sh4NatkwNDU8Om+qn4yVz5oW48TzxUsmUwjTcclfPJvPpjqoaMrNeT8ME1E+
	PRPPzMgcMRL32/NsXQt/i5n4brWimGk26hAy8Vzd1q49tW70H3XEEcrHa38eA7/RLmvF
	OKdDVH0P257DI/e+s4CSzsF01FqIR1CWmv6/9fRoM+El8K342fGmL5C1ftVFSdHVksgh
	IJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PgXFo+uKVxhNWxHLVTJ/LlMvM+/dkU1HhmFAuMgmxUs=;
	b=A4s05DwickHxWDw9KGuJU1QU19PmaY3sUZjTgKx7RHJSc7Cxr8B5lKAiJSeJ24O8ZA
	qRfgJBfSjd1irD6hnPRlGddftLB/Y6Dry+r5PlhkWKyLsZsxku+cEo7URyegNcdoaTDS
	oUmzxadyjhRwYE94kUWYZYpMaeQM4LmSZlIB6W2cBz7ESzmEi9iX3uajVNHRVpkrOduX
	BXiZC8u8NGlKF6HLiJJiClmvmlldRm+VPKOizJEFhl9g4FYZqBjx9lYn8qeMAyHi+Nvg
	pE/NdVLu15LhjUg1pXaR9IuRpg230P333gxsGuDQILuP/hIOwD4zqhuF9TqfDrihiFjn
	shrA==
X-Gm-Message-State: AJcUukfkm4to/rXjcUunbdbEh0zKq0aHOchLGrNCuWds3OpjFGPyithg
	B1vxzGfs5Bmmg3JnmuATAo9Kd68qhhNYnbbNQR64q3aJGLs=
X-Google-Smtp-Source: ALg8bN5pj+juzme6U7T5mnXg35vdLcv4qHVi0mLBKwWgd1Rm6eepuYo8yo5i/KjN+wPaT1cgMEmhq3WLLxbAqNiXHcY=
X-Received: by 2002:a19:aace:: with SMTP id t197mr35160857lfe.7.1549165680564; 
	Sat, 02 Feb 2019 19:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20190125131920.5173-1-dbensoussan@synapticon.com>
	<CADkTA4PAv-Ez7A9H57=MdWHqEYw_DmLQpRKeG9MyrjXup0POYg@mail.gmail.com>
	<CALxi_JG3+8ZNNH6fQHA3+k9rSnO5jyOEM09Zgh4eBbJNJ+qHhg@mail.gmail.com>
In-Reply-To: <CALxi_JG3+8ZNNH6fQHA3+k9rSnO5jyOEM09Zgh4eBbJNJ+qHhg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 2 Feb 2019 22:47:49 -0500
Message-ID: <CADkTA4M4HXCcQKbVG6EkrR4HGnd2NzokHuz5Ob9Kh1Odo8QzJw@mail.gmail.com>
To: david bensoussan <minipada@gmail.com>
Cc: David Bensoussan <dbensoussan@synapticon.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-docker-pycreds & python-docker: Add recipe for python2
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
X-List-Received-Date: Sun, 03 Feb 2019 03:48:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The problem is .. the patch doesn't cleanly cherry pick to sumo. There
are conflicts.

----------
build [/home/bruc...ualization]> git cherry-pick
cbefd4d88c0878c259c53c02a61b713679379124
error: could not apply cbefd4d... add the py2 version for
python-docker and python-docker-pycreds packages
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: and commit the result with 'git commit'
build [/home/bruc...ualization]> git status
On branch sumo
Your branch is up to date with 'origin/sumo'.

You are currently cherry-picking commit cbefd4d.
  (fix conflicts and run "git cherry-pick --continue")
  (use "git cherry-pick --abort" to cancel the cherry-pick operation)

Changes to be committed:

        new file:   recipes-devtools/python/python-docker-pycreds.inc
        new file:   recipes-devtools/python/python-docker-pycreds_0.3.0.bb
        new file:   recipes-devtools/python/python-docker.inc
        new file:   recipes-devtools/python/python-docker_3.4.0.bb

Unmerged paths:

  (use "git add <file>..." to mark resolution)

        both modified:   recipes-devtools/python/python3-docker-pycreds_0.2=
.1.bb
        both modified:   recipes-devtools/python/python3-docker_2.5.1.bb
----------------

The conflicts aren't that bad, but I'm not setup to test sumo at the
moment, so I'd rather if someone working on that branch do the fixups
and send the patch.
i.e. I'd need a sumo specific patch generated and sent to the list.

Cheers,

Bruce

On Thu, Jan 31, 2019 at 3:14 AM david bensoussan <minipada@gmail.com> wrote=
:
>
> I would need it for sumo. Could you cherry pick it and add it there?
>
> On Wed, 30 Jan 2019, 08:04 Bruce Ashfield, <bruce.ashfield@gmail.com> wro=
te:
>>
>> What branch is this for ? The following is already on master:
>>
>> commit cbefd4d88c0878c259c53c02a61b713679379124
>> Author: Ting Yu <tyu@cisco.com>
>> Date:   Thu Dec 13 20:41:04 2018 +0000
>>
>>     add the py2 version for python-docker and python-docker-pycreds pack=
ages
>>
>>     add the py2 version for python-docker and python-docker-pycreds pack=
ages.
>>     add python-six and python-backport_ssl (for ph2 only) as
>> python-docker dependencies.
>>
>>     verify the connection to docker engine at run time -
>>     >>> import docker
>>     >>> client =3D docker.from_env()
>>     >>> client.images.list()
>>     [<Image: 'hello-world:latest'>]
>>
>>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>> :000000 100644 0000000 ca0995f A
>> recipes-devtools/python/python-docker-pycreds.inc
>>
>> Which obviously will conflict with the python-docker-pycreds.inc that
>> you have below.
>>
>> Cheers,
>>
>> Bruce
>>
>> On Fri, Jan 25, 2019 at 8:19 AM David Bensoussan <minipada@gmail.com> wr=
ote:
>> >
>> > ---
>> >  recipes-devtools/python/python-docker-pycreds.inc   |  7 +++++++
>> >  .../python/python-docker-pycreds_0.2.1.bb           |  3 +++
>> >  recipes-devtools/python/python-docker.inc           |  5 +++++
>> >  recipes-devtools/python/python-docker_2.5.1.bb      | 11 +++++++++++
>> >  .../python/python3-docker-pycreds_0.2.1.bb          |  8 +-------
>> >  recipes-devtools/python/python3-docker_2.5.1.bb     | 13 +++---------=
-
>> >  6 files changed, 30 insertions(+), 17 deletions(-)
>> >  create mode 100644 recipes-devtools/python/python-docker-pycreds.inc
>> >  create mode 100644 recipes-devtools/python/python-docker-pycreds_0.2.=
1.bb
>> >  create mode 100644 recipes-devtools/python/python-docker.inc
>> >  create mode 100644 recipes-devtools/python/python-docker_2.5.1.bb
>> >
>> > diff --git a/recipes-devtools/python/python-docker-pycreds.inc b/recip=
es-devtools/python/python-docker-pycreds.inc
>> > new file mode 100644
>> > index 0000000..e76267d
>> > --- /dev/null
>> > +++ b/recipes-devtools/python/python-docker-pycreds.inc
>> > @@ -0,0 +1,7 @@
>> > +SUMMARY =3D "Python bindings for the docker credentials store API"
>> > +HOMEPAGE =3D "https://github.com/shin-/dockerpy-creds"
>> > +LICENSE =3D "Apache-2.0"
>> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57"
>> > +
>> > +SRC_URI[md5sum] =3D "0d80d5aebab771faf7e422b759c3055b"
>> > +SRC_URI[sha256sum] =3D "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2=
c1cf085f335262f7348"
>> > diff --git a/recipes-devtools/python/python-docker-pycreds_0.2.1.bb b/=
recipes-devtools/python/python-docker-pycreds_0.2.1.bb
>> > new file mode 100644
>> > index 0000000..f6ddc8d
>> > --- /dev/null
>> > +++ b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
>> > @@ -0,0 +1,3 @@
>> > +inherit pypi setuptools
>> > +
>> > +require python-docker-pycreds.inc
>> > diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devto=
ols/python/python-docker.inc
>> > new file mode 100644
>> > index 0000000..f23b537
>> > --- /dev/null
>> > +++ b/recipes-devtools/python/python-docker.inc
>> > @@ -0,0 +1,5 @@
>> > +SRC_URI[md5sum] =3D "7d917152976df075e6e90ee853df641f"
>> > +SRC_URI[sha256sum] =3D "b876e6909d8d2360e0540364c3a952a62847137f4674f=
2439320ede16d6db880"
>> > +
>> > +DEPENDS +=3D "${PYTHON_PN}-pip-native"
>> > +
>> > diff --git a/recipes-devtools/python/python-docker_2.5.1.bb b/recipes-=
devtools/python/python-docker_2.5.1.bb
>> > new file mode 100644
>> > index 0000000..9dc83e8
>> > --- /dev/null
>> > +++ b/recipes-devtools/python/python-docker_2.5.1.bb
>> > @@ -0,0 +1,11 @@
>> > +inherit pypi setuptools
>> > +
>> > +RDEPENDS_${PN} +=3D " \
>> > +       python-backports-ssl \
>> > +       python-docker-pycreds \
>> > +       python-requests \
>> > +       python-websocket-client \
>> > +"
>> > +
>> > +require python-docker.inc
>> > +
>> > diff --git a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb b=
/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
>> > index 4038410..52423d2 100644
>> > --- a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
>> > +++ b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
>> > @@ -1,9 +1,3 @@
>> > -SUMMARY =3D "Python bindings for the docker credentials store API"
>> > -HOMEPAGE =3D "https://github.com/shin-/dockerpy-creds"
>> > -LICENSE =3D "Apache-2.0"
>> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57"
>> > -
>> >  inherit pypi setuptools3
>> >
>> > -SRC_URI[md5sum] =3D "0d80d5aebab771faf7e422b759c3055b"
>> > -SRC_URI[sha256sum] =3D "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2=
c1cf085f335262f7348"
>> > +require python-docker-pycreds.inc
>> > diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb b/recipes=
-devtools/python/python3-docker_2.5.1.bb
>> > index 341d95c..0dca028 100644
>> > --- a/recipes-devtools/python/python3-docker_2.5.1.bb
>> > +++ b/recipes-devtools/python/python3-docker_2.5.1.bb
>> > @@ -1,17 +1,10 @@
>> > -SUMMARY =3D "A Python library for the Docker Engine API."
>> > -HOMEPAGE =3D "https://github.com/docker/docker-py"
>> > -LICENSE =3D "Apache-2.0"
>> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34f3846f940453127309b920ee=
b89660"
>> > -
>> >  inherit pypi setuptools3
>> >
>> > -SRC_URI[md5sum] =3D "7d917152976df075e6e90ee853df641f"
>> > -SRC_URI[sha256sum] =3D "b876e6909d8d2360e0540364c3a952a62847137f4674f=
2439320ede16d6db880"
>> > -
>> > -DEPENDS +=3D "${PYTHON_PN}-pip-native"
>> > -
>> >  RDEPENDS_${PN} +=3D " \
>> >         python3-docker-pycreds \
>> >         python3-requests \
>> >         python3-websocket-client \
>> >  "
>> > +
>> > +require python-docker.inc
>> > +
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
> --
>
> David Bensoussan
> Robotique / Ing=C3=A9nieur logiciel embarqu=C3=A9
>
> ________________________________
>
> Synapticon  | Syst=C3=A8mes de contr=C3=B4le robotiques
>
> mobile:004915779804515/0033659971070
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

