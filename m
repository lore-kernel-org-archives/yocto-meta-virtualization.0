Return-Path: <valerio@debevv.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F31EE00C45; Mon, 15 Jan 2018 08:08:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	HTML_MESSAGE,T_DKIM_INVALID autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_DKIM_INVALID DKIM-Signature header exists but is not valid
Received: from out12.keliweb.com (out12.keliweb.com [51.15.185.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49536E006D2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Jan 2018 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debevv.com; 
	s=default;
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:To:
	References:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jWE72AQp9jryeiDTmdvNQM+6dPV2FegCqsMWlsMU2/E=;
	b=EBP7MgZoHUR9kYDvDU+2H7Wj3J
	aaPZW2pdIs45fzFDFyb7F3WBfGANLAMmHUMzKYFL1i1ioa9ys+kBhKugopWWrjd7Vz0nWcD8LdNBH
	TLLMZNXOirOKcz2HyMY89XSVkDQ9nu8pjtFKmPBzLMCCcizaikrk6UV4qRBRjT/ynWNXHJzHuyziU
	eR3hewah/qH1XVXxQLj1259LO8DdpsYb+0Qh3xXv6IOMRVSNv37ViDSXL7SPhyfxJo3C3ufvK6zA/
	+KekqGP9O6cRJii4QKYMyRyVKw7m53CR0Xblc7WjCrJxaVlsspY0bC/DzU634YAie/4gcX2E2S/sY
	aepXyRog==;
Received: from [212.29.154.22] (port=58638 helo=[192.168.1.3])
	by out12.keliweb.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <valerio@debevv.com>) id 1eb7Jf-0000qX-0b
	for meta-virtualization@yoctoproject.org;
	Mon, 15 Jan 2018 17:08:55 +0100
References: <9e2f6fe9-5114-7f66-8137-24d45ee9a9b9@debevv.com>
To: meta-virtualization@yoctoproject.org
From: Valerio De Benedetto <valerio@debevv.com>
X-Forwarded-Message-Id: <9e2f6fe9-5114-7f66-8137-24d45ee9a9b9@debevv.com>
Message-ID: <d1fd3195-0da5-f09b-b8b9-220bfdc01a4c@debevv.com>
Date: Mon, 15 Jan 2018 17:08:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <9e2f6fe9-5114-7f66-8137-24d45ee9a9b9@debevv.com>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - out12.keliweb.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - debevv.com
X-Get-Message-Sender-Via: out12.keliweb.com: authenticated_id:
	valerio@debevv.com
X-Authenticated-Sender: out12.keliweb.com: valerio@debevv.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: docker-compose fails with "ImportError: No module named 'tty'"
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
X-List-Received-Date: Mon, 15 Jan 2018 16:08:57 -0000
Content-Type: multipart/alternative;
	boundary="------------64FC1A9B7CA8A655E8097A4D"
Content-Language: en-US

--------------64FC1A9B7CA8A655E8097A4D
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

Hi, I've made a very simple rocko image for an Intel Quark-based device 
that includes docker and docker-compose. My problem is that running 
docker-compose fails with this message:

Traceback (most recent call last):
   File "/usr/bin/docker-compose", line 11, in <module>
     load_entry_point('docker-compose==1.16.1', 'console_scripts', 
'docker-compose')()
   File 
"/usr/lib/python3.5/site-packages/setuptools-36.2.7-py3.5.egg/pkg_resources/__init__.py", 
line 564, in load_entry_point
   File 
"/usr/lib/python3.5/site-packages/setuptools-36.2.7-py3.5.egg/pkg_resources/__init__.py", 
line 2662, in load_entry_point
   File 
"/usr/lib/python3.5/site-packages/setuptools-36.2.7-py3.5.egg/pkg_resources/__init__.py", 
line 2316, in load
   File 
"/usr/lib/python3.5/site-packages/setuptools-36.2.7-py3.5.egg/pkg_resources/__init__.py", 
line 2322, in resolve
   File "/usr/lib/python3.5/site-packages/compose/cli/main.py", line 58, 
in <module>
     from dockerpty.pty import PseudoTerminal, RunOperation, ExecOperation
   File "/usr/lib/python3.5/site-packages/dockerpty/__init__.py", line 
17, in <module>
     from dockerpty.pty import PseudoTerminal, RunOperation, 
ExecOperation, exec_create
   File "/usr/lib/python3.5/site-packages/dockerpty/pty.py", line 23, in 
<module>
     import dockerpty.tty as tty
   File "/usr/lib/python3.5/site-packages/dockerpty/tty.py", line 21, in 
<module>
     import tty
ImportError: No module named 'tty'

I've satisfied all the requirements in README and tried both with rocko 
and master.


PS: Sorry for the previous mail, but It was not indicated anywhere that 
I had to subscribe first


--------------64FC1A9B7CA8A655E8097A4D
Content-Type: text/html; charset=iso-8859-15
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=iso-8859-15">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font face="DejaVu Sans">Hi, I've made a very simple rocko image for
      an Intel Quark-based device that includes docker and
      docker-compose</font>. My problem is that running docker-compose
    fails with this message:
    <div class="moz-forward-container">
      <p>Traceback (most recent call last):<br>
          File "/usr/bin/docker-compose", line 11, in &lt;module&gt;<br>
            load_entry_point('docker-compose==1.16.1',
        'console_scripts', 'docker-compose')()<br>
          File
"/usr/lib/python3.5/site-packages/setuptools-36.2.7-py3.5.egg/pkg_resources/__init__.py",
        line 564, in load_entry_point<br>
          File
"/usr/lib/python3.5/site-packages/setuptools-36.2.7-py3.5.egg/pkg_resources/__init__.py",
        line 2662, in load_entry_point<br>
          File
"/usr/lib/python3.5/site-packages/setuptools-36.2.7-py3.5.egg/pkg_resources/__init__.py",
        line 2316, in load<br>
          File
"/usr/lib/python3.5/site-packages/setuptools-36.2.7-py3.5.egg/pkg_resources/__init__.py",
        line 2322, in resolve<br>
          File "/usr/lib/python3.5/site-packages/compose/cli/main.py",
        line 58, in &lt;module&gt;<br>
            from dockerpty.pty import PseudoTerminal, RunOperation,
        ExecOperation<br>
          File "/usr/lib/python3.5/site-packages/dockerpty/__init__.py",
        line 17, in &lt;module&gt;<br>
            from dockerpty.pty import PseudoTerminal, RunOperation,
        ExecOperation, exec_create<br>
          File "/usr/lib/python3.5/site-packages/dockerpty/pty.py", line
        23, in &lt;module&gt;<br>
            import dockerpty.tty as tty<br>
          File "/usr/lib/python3.5/site-packages/dockerpty/tty.py", line
        21, in &lt;module&gt;<br>
            import tty<br>
        ImportError: No module named 'tty'<br>
      </p>
      <p>I've satisfied all the requirements in README and tried both
        with rocko and master.</p>
      <p><br>
      </p>
      <p>PS: Sorry for the previous mail, but It was not indicated
        anywhere that I had to subscribe first<br>
      </p>
    </div>
  </body>
</html>

--------------64FC1A9B7CA8A655E8097A4D--
