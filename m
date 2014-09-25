Return-Path: <harshjain32@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 909CAE0086B; Thu, 25 Sep 2014 01:11:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (harshjain32[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.170 listed in list.dnswl.org]
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28D8FE00868
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 01:11:17 -0700 (PDT)
Received: by mail-we0-f170.google.com with SMTP id x48so6075113wes.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 01:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1pArr+2lmp200YfBqX6BRGraMrV0m/tD0kIFYfA50xM=;
	b=bel5OS3DMabv3imeYf9zkDnsOBqCMMPgTe9WbJmMx1ji37vfrbldx3JJZ9hYhzXk9n
	5RQ2iLI1HY6CRDNWALcWdqU5MTJKKv+YcIHxR2RNQ64GjqGbijIgJ03pKkzFhVcmkACQ
	qi3Sv2L8vkFGQMFulJ4eIiowV5vMhASuE7tgWcRMd4n9/7NHZUPlNO/6pZy5AndW5EKv
	OYwIK7dKTFA+TNaX+6K85TqfV+bLaRm8TIuiuIklVDGjyiKqNDDeGa8wRVT77VsOzMwc
	vF7pyi4zFw4FO7MzCeP7YYtZ+IyTeJRGCIMn0SqcDRAKpTNmjki7drIsCeRgIBJI0lKf
	b7bg==
MIME-Version: 1.0
X-Received: by 10.194.95.8 with SMTP id dg8mr14213646wjb.1.1411632676058; Thu,
	25 Sep 2014 01:11:16 -0700 (PDT)
Received: by 10.216.47.202 with HTTP; Thu, 25 Sep 2014 01:11:16 -0700 (PDT)
Date: Thu, 25 Sep 2014 13:41:16 +0530
Message-ID: <CAKuL1XReVfeA9Mm6VGJfUHFwdmTmY3KKR99Agbjta2G_HZe+hw@mail.gmail.com>
From: harsh jain <harshjain32@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: =?UTF-8?B?SW5zdGFsbCBuZXV0cm9uLW1s4oCLMi1wbHVnaW4gdXNpbmcgbWV0YS1jbG91ZOKAiy1zZXJ2aWNlcyBsYXllcg==?=
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
X-List-Received-Date: Thu, 25 Sep 2014 08:11:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

We are trying to install openstack packages using
meta-cloud-services Layer.Command used to clone the reposity is given below

git clone git://github.com/openstack/python-neutron.git -b icehouse

We have selected packagroup-cloud-compute in HOB GUI.
In final filesystem we are expecting neutron-plugin-openvswitch-agent
should be installed,instead of we are getiing
neutron-openvswitch-agent.

In HOB build system we have observed that ml2-plugin files are there
in build folder but are not included in filesystem.

Do we need to do some configuratin in .bb files to install.

