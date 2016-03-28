Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF9A0E0079A; Mon, 28 Mar 2016 07:24:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.66 listed in list.dnswl.org]
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93E04E006AD
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Mar 2016 07:24:13 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id r187so19062791oih.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Mar 2016 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jMYuQ4V/g2Rp9jYBpLKjqMiQgCGdbHf3zgaCne7s0Sg=;
	b=hyWYSLD7snOudXUCpsCpQ08xxTtsFZ39at9574CQO4MthoHxJHvzcQ5DZLuGm1RqUZ
	PcHiBduSBpT0Mz43UqlmbD15ntYOJsyNJgCkP9i9cSNKW+k0OVGMrvRYDCuwPiACFuLU
	ehsgZk7MTX8QouNOSWmfFefJvQe7E7zATVr4E3ANrN7XTGMUmlGod1mlKfj6ifNoHOqg
	9jkUjSioZCkg5vIAP6rWe/YslQTMHMw+q8MxvXbE45HLAfIiWYZlOz6a3jflMycVChEh
	gVVooepC1qweigySVhw0JTspEq7lIDazsgDNb6Wxs3N9ymnJ4VJFKFj83WyAEFM5xEIi
	2TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jMYuQ4V/g2Rp9jYBpLKjqMiQgCGdbHf3zgaCne7s0Sg=;
	b=bEj3ZhcnRkR38nAUcWvDqolKH0wdtuqgl8FsM4M+UV0Rr0Ww197HU3Uw4MU4CQRBzx
	AVrV46Dvbs1yRHQeWeTF9wVE+EDVNM0ZSN9+mAayzy+zq12vMQ9sWATwpE0Qzo1U4NXu
	Lf38M7kkOnminneelUaSkxosDIDecoShrKgS+hAPHbVeH6rbBBSsMjzsVHiKGFBjDPEP
	S/Y+gM2C8NPO2u5Qo4mMjQmfzN3z6XWCYucxH8WcaNLJRjmKAcI2Qiq+GV08a1D4dssQ
	rtZRjJ87rA6OD7mbApS/O7P7CUHOoLc183ETp0yB+SVVn03TbVdFrfbkICHf5QlTLk/7
	Bl/g==
X-Gm-Message-State: AD7BkJIQrp6G+EmU1lBBII5BSUuXpkNsAojVAsSnnLgh/pGbTBL+BKthc7sG/5LYUXCM4l3atwdDpLxBdFOfXw==
X-Received: by 10.157.0.37 with SMTP id 34mr804725ota.161.1459175052567; Mon,
	28 Mar 2016 07:24:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.15.72 with HTTP; Mon, 28 Mar 2016 07:23:53 -0700 (PDT)
In-Reply-To: <CADNbA1o6dqxSNUYgwggfdacMqx_aRM4RDN3DCi_PXL676TDvtQ@mail.gmail.com>
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
	<1458833491-7717-2-git-send-email-derek@asterius.io>
	<CABZSBQea8AKjtfr+TdpVp9kk4uohFof9wHkLNBHZUXGZS4OKWw@mail.gmail.com>
	<CADNbA1o6dqxSNUYgwggfdacMqx_aRM4RDN3DCi_PXL676TDvtQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Mon, 28 Mar 2016 10:23:53 -0400
Message-ID: <CABZSBQdxbp45bKM39P_3SLRFHGymUYuyxYN+Meic3fR5RTWtLA@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/4] xen: add the ability to configure the name of the policy
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
X-List-Received-Date: Mon, 28 Mar 2016 14:24:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 28, 2016 at 9:06 AM, Derek Straka <derek@asterius.io> wrote:
> I had the specific file called out for symlinking during do_deploy.  I can
> wildcard the policy file here and symlink to the first one if more than one
> policy file exists.  Right now I don't know of a case where more than one
> policy is created, so it may never be an issue.
>

Thank you, I missed the other patch and this makes more sense now. +1

