Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01776E009B2; Tue,  4 Sep 2018 10:18:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com
	[209.85.161.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBD88E008E0
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Sep 2018 10:18:29 -0700 (PDT)
Received: by mail-yw1-f54.google.com with SMTP id q129-v6so1549336ywg.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 04 Sep 2018 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1hvnc2VBktf0r5HhzoyF1EkFw6zIVgvcIr7RJMLvgfk=;
	b=YkAP4l7uAlNAHhNNQ1Tq/VoWisH/iVotqyzR5+mBl46o30Ql6cDB0kpG9h3/zQUxMc
	xZpnP5SQjt2qGWp6PtZKg+dwHO/6cmo8InDGuCzaVHgQMldC0ZDqC1/V4+UGvwjiqcFq
	vxFN/cgVzAOROgEa0QuUUFx9kLAy2NtKgkqQPLJviAKSJ3FXNHow3zvDKROlvQlgzp85
	HPuLgbWKfGDAspP2OMG37DvPV9P5vCME3WZU1xDqGhMstPRxFVsC5mgg1DHMI97EvsSX
	cTA0O6uuH05T8/UGWHwJqdP8hLcAr339HSePaZChN9Z01iwrpy4wKHk/1sa0kP5hRe50
	inVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=1hvnc2VBktf0r5HhzoyF1EkFw6zIVgvcIr7RJMLvgfk=;
	b=e3yALj3b4VApULKLb+4iIkaSAFZBNpmM1YSGMXXxcOt6VYw/9f76j+Dldt3JqyS4Q5
	FvNRGi9qI/b9lHf+4JHJSyMaDLRLiPUtEFH9W5TPnDVI0/BrQV4o1O7k93z5+gp93jVS
	LaveH0k9IT7dNpfmyxKrWCivSnaJ+hEtfvOcxuG3A1nqkQUtACUlSOIPUvQyGwieUJd3
	sONFe0V2vuNiXaaH+pX8h0jONznmPPg0KjD8n4Sk0enC4NryR0uGRog4/52gcn90c6HQ
	uXnbqYS1eYvXrl4l0+gul67UZGdlEhlvDTtr0UCf5BolUBPPbYHBqDy0mtRJuxBTA0ve
	8k1Q==
X-Gm-Message-State: APzg51D/KOCRI4GP6T6FiwpRXsGTTQrSW+MgsSsHnIadDqvVU5TIM3ED
	ERIwZTII+9CUgNlF2P2Gwwv+WflwuWWss1lpF0fNz2DO
X-Google-Smtp-Source: ANB0VdaNe/lQaANKnNT+wf4BWeUTh/NI7oVNt8itjsWTtQIyRUnDKxvy1XdMxfV7pmuD9qgOrUF3Mu3CM4gcJa//zhI=
X-Received: by 2002:a81:6142:: with SMTP id
	v63-v6mr19437760ywb.512.1536081508880; 
	Tue, 04 Sep 2018 10:18:28 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a5b:7cf:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 10:18:28 -0700 (PDT)
In-Reply-To: <CAG3Cyz98hmE_nhqd0+ZC93u9Ly87A-q_KQ97BRRpq7oom6vCMA@mail.gmail.com>
References: <CAG3Cyz98hmE_nhqd0+ZC93u9Ly87A-q_KQ97BRRpq7oom6vCMA@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Tue, 4 Sep 2018 13:18:28 -0400
X-Google-Sender-Auth: ydoow2EQhFoqxfVcObTAuQOK1qo
Message-ID: <CAPuovEKkknKeWwQoiAMLFoT_E=hxy4ZYnzXs2ft+F5VV3YiJ6A@mail.gmail.com>
To: Sarayu Sivanandam <sarayu@m5nv.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: LXC yocto - how to auto load and execute on QEMU
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
X-List-Received-Date: Tue, 04 Sep 2018 17:18:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 3, 2018 at 2:06 PM, Sarayu Sivanandam <sarayu@m5nv.com> wrote:
> Hi ,
>
> I was able to see that the meta-virtualization layer has a recipe for LXC
> and the same is included in my bblayers conf file and the lxc rpm is
> generated . I was able to build the fsl-virt image and bring up my qemu as
> well . But i want to now be able to test lxc on my qemu setup. I was able to
> enable networking and transfer the rpm generated for lxc (
> lxc-1.1.4-r0.aarch64.rpm ) to qemu and install the same . How ever when i
> try to execute the lxc command it shows the below error .
>
> lxc-config: error while loading shared libraries: libseccomp.so.0: cannot
> open shared object file: No such file or directory
>
> I understand that LXC needs certain libraries to execute but i would like to
> know what is the default way to add it in my fsl-virt image instead of
> having to manually copy all the dependencies.
> I would like to bring up the qemu and then directly be able to install and
> use the lxc.

Ideally you would include LXC in your rootfs image via IMAGE_INSTALL
or similar but you are indicating in the way you are asking your
question that this is not the desired process for your circumstance.
Since you have network connectivity you can setup the resulting RPMs
in a package feed and then install the LXC package in the same way you
would do an 'apt install XXX' on a Ubuntu machine. This will pull in
all the required packages as well as LXC. LXC has a lot of
dependencies, you can examine them via 'rpm -qRp
tmp/deploy/rpm/core2_64/lxc-3.0.1-r0.core2_64.rpm'.

Mark

>
> Please let me know if this is feasible.
>
> Thanks and Regards
> Sarayu
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

