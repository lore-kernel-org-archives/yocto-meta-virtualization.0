Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2236E0079E; Mon, 29 Sep 2014 08:56:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.45 listed in list.dnswl.org]
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D61D7E006DB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Sep 2014 08:56:24 -0700 (PDT)
Received: by mail-la0-f45.google.com with SMTP id q1so6715345lam.32
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Sep 2014 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TYKAxHAuQ+uFeACPOYNl0Pleh7g080qQhMHXlNoE6fk=;
	b=jnq4FRqA+bmu6VcKPyh/9iutacbeATVZ3Q/nbYnY8vVQd7GixTuBPnwv6SKLYFD8Jy
	T8mI4zdrov2wW0C6rPgP+rcZV1duKL+KySxkF2g13Jz/roj8kAdgiLflIK6wy+eIPusE
	JpFQb7O7BNYw/aPMyUHvd4qr3GDeBDaxeiUdSEl7PuYuwKm3cz7hLBgn7pAhVHTPNar7
	DfH4Kl16UouYn5H5sNxe8t7tqofNvTllEtATzQE+nHeUXXPqwbscaQvUbJium5oKQfbn
	hFZZdb3C1KTQasjTMVvP9KKVgWm5CId8/spVQ0uitTHGEJnARr7Y1MncpKSPo6MV+gmC
	r+ow==
MIME-Version: 1.0
X-Received: by 10.112.163.103 with SMTP id yh7mr38295759lbb.73.1412006183597; 
	Mon, 29 Sep 2014 08:56:23 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Mon, 29 Sep 2014 08:56:23 -0700 (PDT)
In-Reply-To: <CAKuL1XReVfeA9Mm6VGJfUHFwdmTmY3KKR99Agbjta2G_HZe+hw@mail.gmail.com>
References: <CAKuL1XReVfeA9Mm6VGJfUHFwdmTmY3KKR99Agbjta2G_HZe+hw@mail.gmail.com>
Date: Mon, 29 Sep 2014 11:56:23 -0400
Message-ID: <CADkTA4Nt8B2cdvFqhbdQn879DXUw68hBg_r87YMXVv8tfZZ0Ow@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: harsh jain <harshjain32@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: =?UTF-8?B?UmU6IEluc3RhbGwgbmV1dHJvbi1tbOKAizItcGx1Z2luIHVzaW5nIG1ldGEtY2xvdWTigIstc2VydmljZXMgbGF5ZXI=?=
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
X-List-Received-Date: Mon, 29 Sep 2014 15:56:30 -0000
Content-Type: text/plain; charset=UTF-8

Sorry for the slow reply, things have been a bit busy.

On Thu, Sep 25, 2014 at 4:11 AM, harsh jain <harshjain32@gmail.com> wrote:
> Hi,
>
> We are trying to install openstack packages using
> meta-cloud-services Layer.Command used to clone the reposity is given below
>
> git clone git://github.com/openstack/python-neutron.git -b icehouse
>
> We have selected packagroup-cloud-compute in HOB GUI.
> In final filesystem we are expecting neutron-plugin-openvswitch-agent
> should be installed,instead of we are getiing
> neutron-openvswitch-agent.
>
> In HOB build system we have observed that ml2-plugin files are there
> in build folder but are not included in filesystem.

What exactly are you looking for ? The neutron-openvswitch-agent is
launched with
the openvswitch neutron plugin ini file, and hence should take care of
the functionality
you are looking for.

If you are looking for the openvswitch mech driver, python-neutron
itself is packaging
the files.

>
> Do we need to do some configuratin in .bb files to install.

perhaps, but I'm not sure I understand what you are trying to achieve yet.

Cheers,

Bruce

> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

