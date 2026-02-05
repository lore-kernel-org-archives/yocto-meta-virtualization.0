Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DB8EA7953
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 01:51:46 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11470.1770256296437302680
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 17:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YUt5UfWK;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso3298495ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Feb 2026 17:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770256296; cv=none;
        d=google.com; s=arc-20240605;
        b=aOzKHKo27ZT8TEqlxVlwFwQXgG2dFm7kBKnUmvIucM2PYiMGNejE4HXWHUnjdb6z/Y
         zTiU0iVnFoVzzmgzVrVm/XQN+sDullXcBSg9OlusaU2+hInkEWcf56S/Cbd+oMul8SlX
         PmoY2kFw+Pwz2futJiYvmZKgngE3hQLEOHUGWOoWsZZ3M89gCp8TeDg1NjIvtBLRYxE9
         kEPyXgEanDSdBI+Ra5fFoFIOwWsjXCUiOKeJTcfdIB2G8LlA13oDihSow66XZofCKosW
         31GtcU9TwlGfICQhykzE4qso4lIof159k6eoz77PcL/2BcrrrT/scl+mJkTu/DtvExB/
         n77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6dDk9YnxsVouKkN27aAZ4GxBTlhNMeoO2H5lLaBhNIg=;
        fh=MC0H+kyKmc6R9ISOsj3vrIFK0bsc7GsK5VRjmuoJQ6o=;
        b=ktf1C90YG07fWi+HePNAEgIgnFZ9Cl+dYOTTmXfZhH1/rFpoJ12uAToiZ6gcNEY5HL
         sOdpihANjPlVmZ80eJfKiPqyHkXDaT0KT+VE4zYpiqHCn48b0fW/cDOVE2IgxgriyykB
         rBG0ZOfRAQsLN7SIt7q5VFwvFsoCc30DRxX5otu77ac+w2PUkLWaw23eoo7I3bug+l6j
         WWWmegV7wXjUoJ83FyNG4AZ/gc7v4dJ+c4QmibSn7DrW3yVuH4UgQmuLzg34ddiPNVvg
         Ff4uAMWBdNzyuPWVq+4EC1qFHNfwu34pStAYxtlFSPMfvab6WR4UySJxGK2AOsEA2QPS
         GI1g==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770256296; x=1770861096; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6dDk9YnxsVouKkN27aAZ4GxBTlhNMeoO2H5lLaBhNIg=;
        b=YUt5UfWKuO1pg/50phistYi6y9gf4R6btTDUryqusnnSkH8bRiG+XevcHEvm90xqxu
         8pAXTHUd/AhgiST+4s3CI27+zjs3lFTUNQXRjIWZHlLRoedSeWPeSgdwOKDBnF2CQehF
         AVDrUaG/A9ZAF14YKS9a1c1zNHSvrIYsfuMG620z0IvU5sr8KWqw4VJ8BfSfjjVPBGb2
         M6F4o/n7hvg+gZiY8D3E7HnP8mV9ea3mqFXPoxnxC8WpWb86tXvBC2bYg4kDiF8e2q6d
         rSn5Ukonzkl9bEGUK815YU3LnH9oMqjCpvMExGDn2hweX1zSYtCJ1YX1bUF1kTySThL6
         LTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770256296; x=1770861096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dDk9YnxsVouKkN27aAZ4GxBTlhNMeoO2H5lLaBhNIg=;
        b=ei8/05lAZXCz9I45Meb1dhhcrys223/vF0pxZzAnzbJbRae1fCtSK1aNZVXAX7Kjgy
         4eBrFszyOs7vbHQzQkZ5WWtZoENpy068eMwfefFx/F/S2ONI/DR/LFihoDNYzZsp9M9G
         wNHeVthYyjS6kYy8VBqAn7CZQpwj/vP8Bu5A6D8UlphDm3B5fX5YCExvxozsfbutgBJ8
         eQr1ehEDH8SFFt0r+UlNwbibWlOboPd/2tlan0xcgeeGDI+1zpC7um0PvGcnAYj6R6Rc
         KUSO6G++D8aluohmiQ8qLd/9a+OmzY5O5AnkfIjGtSf3jIOrINUlUg7tgRr6TVKu+H+a
         MTqw==
X-Gm-Message-State: AOJu0Yy8OjRg9hrvY25vmdUAz9SNpIJNmm+3lVgIXSapkK58Czckjpt/
	X7fWIlZS4RV+beNSuhgHb6Q2+sYcoBvb/2eIa0VLhySGTMY+JysXC/3GNONgt2DcpwfA0w9Nt47
	zH60fSQ5nM4dHIcPC3J5P7v/VvvChZHs=
X-Gm-Gg: AZuq6aJhlRfBlovLlePehsZJBrBFVpMN4vGkxScWN3/S0u9vze6geNk85iEkgzdyyp2
	7+K6QeoWGTasbHB7X1b7/Y4Bdf2f7G9+/rIOfDsw9KadFA4g8Zoj/xgIB16MTJ7kflRCQEjJRbH
	Q3hWBrk9IKHwfLRHNvrglmVnVto9EQTkbfkyTLLFPLmobHqGSLUYo0Nrx6gXV0+2aklhE+0k8zv
	F1GrJtmVgm+uuas43S8YIEf1Y9BhwHiwR2DTTPeJmFut+jSEtdtsK8fdnM1Q6FPxqog7bjB6Qxk
	O4AF+qGL+upq14FiMJlWK86VFPzj
X-Received: by 2002:a17:903:b46:b0:2a9:42ba:b093 with SMTP id
 d9443c01a7336-2a942bab2c7mr9309615ad.25.1770256295534; Wed, 04 Feb 2026
 17:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20260112060705.193801-1-hprajapati@mvista.com>
In-Reply-To: <20260112060705.193801-1-hprajapati@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 20:51:23 -0500
X-Gm-Features: AZwV_Qga4r7oF3Dyfcfzi3-2wxT4uPBuUgWwY9coSu6UcWYo51KqXq0vNJpm9kQ
Message-ID: <CADkTA4NDWsCm2pVoLpfi-DtAX+i7eyR5M+d27rzUAT_WV-peTA@mail.gmail.com>
Subject: Re: [meta-virtualization][scarthgap][PATCH] docker-moby: Fix CVE-2024-29018
To: hprajapati@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a825da064a09e9a3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Feb 2026 01:51:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9560

--000000000000a825da064a09e9a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the delay, this will be merged shortly.

Bruce

On Mon, Jan 12, 2026 at 1:07=E2=80=AFAM Hitendra Prajapati via
lists.yoctoproject.org <hprajapati=3Dmvista.com@lists.yoctoproject.org> wro=
te:

> Upstream-Status: Backport from
> https://github.com/moby/moby/commit/e63daec8672d77ac0b2b5c262ef525c7cf17f=
d20
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |   1 +
>  .../docker/files/CVE-2024-29018.patch         | 344 ++++++++++++++++++
>  2 files changed, 345 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-29018.patch
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb
> b/recipes-containers/docker/docker-moby_git.bb
> index d274b002..1331930e 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -58,6 +58,7 @@ SRC_URI =3D "\
>
>  file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc/import =
\
>          file://CVE-2024-36620.patch;patchdir=3Dsrc/import \
>          file://CVE-2024-36621.patch;patchdir=3Dsrc/import \
> +        file://CVE-2024-29018.patch;patchdir=3Dsrc/import \
>         "
>
>  DOCKER_COMMIT =3D "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-29018.patch
> b/recipes-containers/docker/files/CVE-2024-29018.patch
> new file mode 100644
> index 00000000..f3c800ff
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-29018.patch
> @@ -0,0 +1,344 @@
> +From 20c205fd3a0081d005958eff690e2b34df1c5e5e Mon Sep 17 00:00:00 2001
> +From: Rob Murray <rob.murray@docker.com>
> +Date: Tue, 19 Mar 2024 11:19:30 +0000
> +Subject: [PATCH 1/2] Environment variable to override resolv.conf path.
> +
> +If env var DOCKER_TEST_RESOLV_CONF_PATH is set, treat it as an override
> +for the 'resolv.conf' path.
> +
> +Added as part of resolv.conf refactoring, but needed by back-ported test
> +TestInternalNetworkDNS.
> +
> +Signed-off-by: Rob Murray <rob.murray@docker.com>
> +
> +CVE: CVE-2024-29018
> +Upstream-Status: Backport [
> https://github.com/moby/moby/commit/e63daec8672d77ac0b2b5c262ef525c7cf17f=
d20
> ]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + daemon/container_operations_unix.go       |  20 +--
> + integration/networking/resolvconf_test.go | 142 ++++++++++++++++++++++
> + libnetwork/endpoint.go                    |  12 +-
> + libnetwork/resolver.go                    |  17 ++-
> + libnetwork/sandbox_dns_unix.go            |   9 +-
> + 5 files changed, 182 insertions(+), 18 deletions(-)
> + create mode 100644 integration/networking/resolvconf_test.go
> +
> +diff --git a/daemon/container_operations_unix.go
> b/daemon/container_operations_unix.go
> +index 6a23a4ca92..e9be1b4e72 100644
> +--- a/daemon/container_operations_unix.go
> ++++ b/daemon/container_operations_unix.go
> +@@ -380,6 +380,7 @@ func serviceDiscoveryOnDefaultNetwork() bool {
> +
> + func setupPathsAndSandboxOptions(container *container.Container, cfg
> *config.Config, sboxOptions *[]libnetwork.SandboxOption) error {
> +       var err error
> ++      var originResolvConfPath string
> +
> +       // Set the correct paths for /etc/hosts and /etc/resolv.conf,
> based on the
> +       // networking-mode of the container. Note that containers with
> "container"
> +@@ -393,8 +394,8 @@ func setupPathsAndSandboxOptions(container
> *container.Container, cfg *config.Con
> +               *sboxOptions =3D append(
> +                       *sboxOptions,
> +                       libnetwork.OptionOriginHostsPath("/etc/hosts"),
> +-
> libnetwork.OptionOriginResolvConfPath("/etc/resolv.conf"),
> +               )
> ++              originResolvConfPath =3D "/etc/resolv.conf"
> +       case container.HostConfig.NetworkMode.IsUserDefined():
> +               // The container uses a user-defined network. We use the
> embedded DNS
> +               // server for container name resolution and to act as a
> DNS forwarder
> +@@ -407,10 +408,7 @@ func setupPathsAndSandboxOptions(container
> *container.Container, cfg *config.Con
> +               // If systemd-resolvd is used, the "upstream" DNS servers
> can be found in
> +               // /run/systemd/resolve/resolv.conf. We do not query thos=
e
> DNS servers
> +               // directly, as they can be dynamically reconfigured.
> +-              *sboxOptions =3D append(
> +-                      *sboxOptions,
> +-
> libnetwork.OptionOriginResolvConfPath("/etc/resolv.conf"),
> +-              )
> ++              originResolvConfPath =3D "/etc/resolv.conf"
> +       default:
> +               // For other situations, such as the default bridge
> network, container
> +               // discovery / name resolution is handled through
> /etc/hosts, and no
> +@@ -423,11 +421,15 @@ func setupPathsAndSandboxOptions(container
> *container.Container, cfg *config.Con
> +               // DNS servers on the host can be dynamically updated.
> +               //
> +               // Copy the host's resolv.conf for the container
> (/run/systemd/resolve/resolv.conf or /etc/resolv.conf)
> +-              *sboxOptions =3D append(
> +-                      *sboxOptions,
> +-
> libnetwork.OptionOriginResolvConfPath(cfg.GetResolvConf()),
> +-              )
> ++              originResolvConfPath =3D cfg.GetResolvConf()
> ++      }
> ++
> ++      // Allow tests to point at their own resolv.conf file.
> ++      if envPath :=3D os.Getenv("DOCKER_TEST_RESOLV_CONF_PATH"); envPat=
h
> !=3D "" {
> ++              log.G(context.TODO()).Infof("Using OriginResolvConfPath
> from env: %s", envPath)
> ++              originResolvConfPath =3D envPath
> +       }
> ++      *sboxOptions =3D append(*sboxOptions,
> libnetwork.OptionOriginResolvConfPath(originResolvConfPath))
> +
> +       container.HostsPath, err =3D container.GetRootResourcePath("hosts=
")
> +       if err !=3D nil {
> +diff --git a/integration/networking/resolvconf_test.go
> b/integration/networking/resolvconf_test.go
> +new file mode 100644
> +index 0000000000..60c8b1bc9a
> +--- /dev/null
> ++++ b/integration/networking/resolvconf_test.go
> +@@ -0,0 +1,142 @@
> ++package networking
> ++
> ++import (
> ++      "net"
> ++      "os"
> ++      "testing"
> ++
> ++      containertypes "github.com/docker/docker/api/types/container"
> ++      "github.com/docker/docker/integration/internal/container"
> ++      "github.com/docker/docker/integration/internal/network"
> ++      "github.com/docker/docker/testutil/daemon"
> ++      "github.com/miekg/dns"
> ++      "gotest.tools/v3/assert"
> ++      is "gotest.tools/v3/assert/cmp"
> ++      "gotest.tools/v3/skip"
> ++)
> ++
> ++// writeTempResolvConf writes a resolv.conf that only contains a single
> ++// nameserver line, with address addr.
> ++// It returns the name of the temp file.
> ++func writeTempResolvConf(t *testing.T, addr string) string {
> ++      t.Helper()
> ++      // Not using t.TempDir() here because in rootless mode, while the
> temporary
> ++      // directory gets mode 0777, it's a subdir of an 0700 directory
> owned by root.
> ++      // So, it's not accessible by the daemon.
> ++      f, err :=3D os.CreateTemp("", "resolv.conf")
> ++      assert.NilError(t, err)
> ++      t.Cleanup(func() { os.Remove(f.Name()) })
> ++      err =3D f.Chmod(0644)
> ++      assert.NilError(t, err)
> ++      f.Write([]byte("nameserver " + addr + "\n"))
> ++      return f.Name()
> ++}
> ++
> ++const dnsRespAddr =3D "10.11.12.13"
> ++
> ++// startDaftDNS starts and returns a really, really daft DNS server tha=
t
> only
> ++// responds to type-A requests, and always with address dnsRespAddr.
> ++func startDaftDNS(t *testing.T, addr string) *dns.Server {
> ++      serveDNS :=3D func(w dns.ResponseWriter, query *dns.Msg) {
> ++              if query.Question[0].Qtype =3D=3D dns.TypeA {
> ++                      resp :=3D &dns.Msg{}
> ++                      resp.SetReply(query)
> ++                      answer :=3D &dns.A{
> ++                              Hdr: dns.RR_Header{
> ++                                      Name:   query.Question[0].Name,
> ++                                      Rrtype: dns.TypeA,
> ++                                      Class:  dns.ClassINET,
> ++                                      Ttl:    600,
> ++                              },
> ++                      }
> ++                      answer.A =3D net.ParseIP(dnsRespAddr)
> ++                      resp.Answer =3D append(resp.Answer, answer)
> ++                      _ =3D w.WriteMsg(resp)
> ++              }
> ++      }
> ++
> ++      conn, err :=3D net.ListenUDP("udp", &net.UDPAddr{
> ++              IP:   net.ParseIP(addr),
> ++              Port: 53,
> ++      })
> ++      assert.NilError(t, err)
> ++
> ++      server :=3D &dns.Server{Handler: dns.HandlerFunc(serveDNS),
> PacketConn: conn}
> ++      go func() {
> ++              _ =3D server.ActivateAndServe()
> ++      }()
> ++
> ++      return server
> ++}
> ++
> ++// Check that when a container is connected to an internal network, DNS
> ++// requests sent to daemon's internal DNS resolver are not forwarded to
> ++// an upstream resolver listening on a localhost address.
> ++// (Assumes the host does not already have a DNS server on 127.0.0.1.)
> ++func TestInternalNetworkDNS(t *testing.T) {
> ++      skip.If(t, testEnv.DaemonInfo.OSType =3D=3D "windows", "No resolv=
.conf
> on Windows")
> ++      skip.If(t, testEnv.IsRootless, "Can't use resolver on host in
> rootless mode")
> ++      ctx :=3D setupTest(t)
> ++
> ++      // Start a DNS server on the loopback interface.
> ++      server :=3D startDaftDNS(t, "127.0.0.1")
> ++      defer server.Shutdown()
> ++
> ++      // Set up a temp resolv.conf pointing at that DNS server, and a
> daemon using it.
> ++      tmpFileName :=3D writeTempResolvConf(t, "127.0.0.1")
> ++      d :=3D daemon.New(t,
> daemon.WithEnvVars("DOCKER_TEST_RESOLV_CONF_PATH=3D"+tmpFileName))
> ++      d.StartWithBusybox(ctx, t, "--experimental", "--ip6tables")
> ++      defer d.Stop(t)
> ++
> ++      c :=3D d.NewClientT(t)
> ++      defer c.Close()
> ++
> ++      intNetName :=3D "intnet"
> ++      network.CreateNoError(ctx, t, c, intNetName,
> ++              network.WithDriver("bridge"),
> ++              network.WithInternal(),
> ++      )
> ++      defer network.RemoveNoError(ctx, t, c, intNetName)
> ++
> ++      extNetName :=3D "extnet"
> ++      network.CreateNoError(ctx, t, c, extNetName,
> ++              network.WithDriver("bridge"),
> ++      )
> ++      defer network.RemoveNoError(ctx, t, c, extNetName)
> ++
> ++      // Create a container, initially with external connectivity.
> ++      // Expect the external DNS server to respond to a request from th=
e
> container.
> ++      ctrId :=3D container.Run(ctx, t, c,
> container.WithNetworkMode(extNetName))
> ++      defer c.ContainerRemove(ctx, ctrId,
> containertypes.RemoveOptions{Force: true})
> ++      res, err :=3D container.Exec(ctx, c, ctrId, []string{"nslookup",
> "test.example"})
> ++      assert.NilError(t, err)
> ++      assert.Check(t, is.Equal(res.ExitCode, 0))
> ++      assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
> ++
> ++      // Connect the container to the internal network as well.
> ++      // External DNS should still be used.
> ++      err =3D c.NetworkConnect(ctx, intNetName, ctrId, nil)
> ++      assert.NilError(t, err)
> ++      res, err =3D container.Exec(ctx, c, ctrId, []string{"nslookup",
> "test.example"})
> ++      assert.NilError(t, err)
> ++      assert.Check(t, is.Equal(res.ExitCode, 0))
> ++      assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
> ++
> ++      // Disconnect from the external network.
> ++      // Expect no access to the external DNS.
> ++      err =3D c.NetworkDisconnect(ctx, extNetName, ctrId, true)
> ++      assert.NilError(t, err)
> ++      res, err =3D container.Exec(ctx, c, ctrId, []string{"nslookup",
> "test.example"})
> ++      assert.NilError(t, err)
> ++      assert.Check(t, is.Equal(res.ExitCode, 1))
> ++      assert.Check(t, is.Contains(res.Stdout(), "SERVFAIL"))
> ++
> ++      // Reconnect the external network.
> ++      // Check that the external DNS server is used again.
> ++      err =3D c.NetworkConnect(ctx, extNetName, ctrId, nil)
> ++      assert.NilError(t, err)
> ++      res, err =3D container.Exec(ctx, c, ctrId, []string{"nslookup",
> "test.example"})
> ++      assert.NilError(t, err)
> ++      assert.Check(t, is.Equal(res.ExitCode, 0))
> ++      assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
> ++}
> +diff --git a/libnetwork/endpoint.go b/libnetwork/endpoint.go
> +index d9c257dc68..3ca546a4ac 100644
> +--- a/libnetwork/endpoint.go
> ++++ b/libnetwork/endpoint.go
> +@@ -538,8 +538,13 @@ func (ep *Endpoint) sbJoin(sb *Sandbox, options
> ...EndpointOption) (err error) {
> +               return sb.setupDefaultGW()
> +       }
> +
> +-      moveExtConn :=3D sb.getGatewayEndpoint() !=3D extEp
> ++      currentExtEp :=3D sb.getGatewayEndpoint()
> ++      // Enable upstream forwarding if the sandbox gained external
> connectivity.
> ++      if sb.resolver !=3D nil {
> ++              sb.resolver.SetForwardingPolicy(currentExtEp !=3D nil)
> ++      }
> +
> ++      moveExtConn :=3D currentExtEp !=3D extEp
> +       if moveExtConn {
> +               if extEp !=3D nil {
> +                       log.G(context.TODO()).Debugf("Revoking external
> connectivity on endpoint %s (%s)", extEp.Name(), extEp.ID())
> +@@ -735,6 +740,11 @@ func (ep *Endpoint) sbLeave(sb *Sandbox, force bool=
,
> options ...EndpointOption)
> +
> +       // New endpoint providing external connectivity for the sandbox
> +       extEp =3D sb.getGatewayEndpoint()
> ++      // Disable upstream forwarding if the sandbox lost external
> connectivity.
> ++      if sb.resolver !=3D nil {
> ++              sb.resolver.SetForwardingPolicy(extEp !=3D nil)
> ++      }
> ++
> +       if moveExtConn && extEp !=3D nil {
> +               log.G(context.TODO()).Debugf("Programming external
> connectivity on endpoint %s (%s)", extEp.Name(), extEp.ID())
> +               extN, err :=3D extEp.getNetworkFromStore()
> +diff --git a/libnetwork/resolver.go b/libnetwork/resolver.go
> +index 9df2154499..5d5686fc86 100644
> +--- a/libnetwork/resolver.go
> ++++ b/libnetwork/resolver.go
> +@@ -9,6 +9,7 @@ import (
> +       "strconv"
> +       "strings"
> +       "sync"
> ++      "sync/atomic"
> +       "time"
> +
> +       "github.com/containerd/log"
> +@@ -75,7 +76,7 @@ type Resolver struct {
> +       tcpListen     *net.TCPListener
> +       err           error
> +       listenAddress string
> +-      proxyDNS      bool
> ++      proxyDNS      atomic.Bool
> +       startCh       chan struct{}
> +       logger        *log.Entry
> +
> +@@ -85,15 +86,17 @@ type Resolver struct {
> +
> + // NewResolver creates a new instance of the Resolver
> + func NewResolver(address string, proxyDNS bool, backend DNSBackend)
> *Resolver {
> +-      return &Resolver{
> ++      r :=3D &Resolver{
> +               backend:       backend,
> +-              proxyDNS:      proxyDNS,
> +               listenAddress: address,
> +               err:           fmt.Errorf("setup not done yet"),
> +               startCh:       make(chan struct{}, 1),
> +               fwdSem:        semaphore.NewWeighted(maxConcurrent),
> +               logInverval:   rate.Sometimes{Interval: logInterval},
> +       }
> ++      r.proxyDNS.Store(proxyDNS)
> ++
> ++      return r
> + }
> +
> + func (r *Resolver) log(ctx context.Context) *log.Entry {
> +@@ -194,6 +197,12 @@ func (r *Resolver) SetExtServers(extDNS
> []extDNSEntry) {
> +       }
> + }
> +
> ++// SetForwardingPolicy re-configures the embedded DNS resolver to eithe=
r
> enable or disable forwarding DNS queries to
> ++// external servers.
> ++func (r *Resolver) SetForwardingPolicy(policy bool) {
> ++      r.proxyDNS.Store(policy)
> ++}
> ++
> + // NameServer returns the IP of the DNS resolver for the containers.
> + func (r *Resolver) NameServer() string {
> +       return r.listenAddress
> +@@ -421,7 +430,7 @@ func (r *Resolver) serveDNS(w dns.ResponseWriter,
> query *dns.Msg) {
> +               return
> +       }
> +
> +-      if r.proxyDNS {
> ++      if r.proxyDNS.Load() {
> +               // If the user sets ndots > 0 explicitly and the query is
> +               // in the root domain don't forward it out. We will retur=
n
> +               // failure and let the client retry with the search domai=
n
> +diff --git a/libnetwork/sandbox_dns_unix.go
> b/libnetwork/sandbox_dns_unix.go
> +index e30f394057..9f7a1c4671 100644
> +--- a/libnetwork/sandbox_dns_unix.go
> ++++ b/libnetwork/sandbox_dns_unix.go
> +@@ -30,10 +30,11 @@ const (
> + func (sb *Sandbox) startResolver(restore bool) {
> +       sb.resolverOnce.Do(func() {
> +               var err error
> +-              // The embedded resolver is always started with proxyDNS
> set as true, even when the sandbox is only attached to
> +-              // an internal network. This way, it's the driver
> responsibility to make sure `connect` syscall fails fast when
> +-              // no external connectivity is available (eg. by not
> setting a default gateway).
> +-              sb.resolver =3D NewResolver(resolverIPSandbox, true, sb)
> ++              // The resolver is started with proxyDNS=3Dfalse if the
> sandbox does not currently
> ++              // have a gateway. So, if the Sandbox is only connected t=
o
> an 'internal' network,
> ++              // it will not forward DNS requests to external resolvers=
.
> The resolver's
> ++              // proxyDNS setting is then updated as network Endpoints
> are added/removed.
> ++              sb.resolver =3D NewResolver(resolverIPSandbox,
> sb.getGatewayEndpoint() !=3D nil, sb)
> +               defer func() {
> +                       if err !=3D nil {
> +                               sb.resolver =3D nil
> +--
> +2.50.1
> +
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9548):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9548
> Mute This Topic: https://lists.yoctoproject.org/mt/117219699/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a825da064a09e9a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Sor=
ry for the delay, this will be merged shortly.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 12, 2026=
 at 1:07=E2=80=AFAM Hitendra Prajapati via <a href=3D"http://lists.yoctopro=
ject.org">lists.yoctoproject.org</a> &lt;hprajapati=3D<a href=3D"mailto:mvi=
sta.com@lists.yoctoproject.org">mvista.com@lists.yoctoproject.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upstream-S=
tatus: Backport from <a href=3D"https://github.com/moby/moby/commit/e63daec=
8672d77ac0b2b5c262ef525c7cf17fd20" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/moby/moby/commit/e63daec8672d77ac0b2b5c262ef525c7cf17fd20</=
a><br>
<br>
Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.c=
om" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a>=C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../docker/files/CVE-2024-29018.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 344 ++++++++++++++++++<br>
=C2=A02 files changed, 345 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/docker/files/CVE-2024-29018.pat=
ch<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> b/recipes-con=
tainers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">docker-moby_git.bb</a><br>
index d274b002..1331930e 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
@@ -58,6 +58,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dynbinary-use-go-cross-compil=
er.patch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-36620.patch;patchdir=3Dsr=
c/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-36621.patch;patchdir=3Dsr=
c/import \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-29018.patch;patchdir=3Dsrc/imp=
ort \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0DOCKER_COMMIT =3D &quot;${SRCREV_moby}&quot;<br>
diff --git a/recipes-containers/docker/files/CVE-2024-29018.patch b/recipes=
-containers/docker/files/CVE-2024-29018.patch<br>
new file mode 100644<br>
index 00000000..f3c800ff<br>
--- /dev/null<br>
+++ b/recipes-containers/docker/files/CVE-2024-29018.patch<br>
@@ -0,0 +1,344 @@<br>
+From 20c205fd3a0081d005958eff690e2b34df1c5e5e Mon Sep 17 00:00:00 2001<br>
+From: Rob Murray &lt;<a href=3D"mailto:rob.murray@docker.com" target=3D"_b=
lank">rob.murray@docker.com</a>&gt;<br>
+Date: Tue, 19 Mar 2024 11:19:30 +0000<br>
+Subject: [PATCH 1/2] Environment variable to override resolv.conf path.<br=
>
+<br>
+If env var DOCKER_TEST_RESOLV_CONF_PATH is set, treat it as an override<br=
>
+for the &#39;resolv.conf&#39; path.<br>
+<br>
+Added as part of resolv.conf refactoring, but needed by back-ported test<b=
r>
+TestInternalNetworkDNS.<br>
+<br>
+Signed-off-by: Rob Murray &lt;<a href=3D"mailto:rob.murray@docker.com" tar=
get=3D"_blank">rob.murray@docker.com</a>&gt;<br>
+<br>
+CVE: CVE-2024-29018<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/moby/moby/commit/=
e63daec8672d77ac0b2b5c262ef525c7cf17fd20" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/moby/moby/commit/e63daec8672d77ac0b2b5c262ef525c7cf1=
7fd20</a>]<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+---<br>
+ daemon/container_operations_unix.go=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 =
+--<br>
+ integration/networking/resolvconf_test.go | 142 ++++++++++++++++++++++<br=
>
+ libnetwork/endpoint.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
+ libnetwork/resolver.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 ++-<br>
+ libnetwork/sandbox_dns_unix.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A09 +-<br>
+ 5 files changed, 182 insertions(+), 18 deletions(-)<br>
+ create mode 100644 integration/networking/resolvconf_test.go<br>
+<br>
+diff --git a/daemon/container_operations_unix.go b/daemon/container_operat=
ions_unix.go<br>
+index 6a23a4ca92..e9be1b4e72 100644<br>
+--- a/daemon/container_operations_unix.go<br>
++++ b/daemon/container_operations_unix.go<br>
+@@ -380,6 +380,7 @@ func serviceDiscoveryOnDefaultNetwork() bool {<br>
+ <br>
+ func setupPathsAndSandboxOptions(container *container.Container, cfg *con=
fig.Config, sboxOptions *[]libnetwork.SandboxOption) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var err error<br>
++=C2=A0 =C2=A0 =C2=A0 var originResolvConfPath string<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Set the correct paths for /etc/hosts and /et=
c/resolv.conf, based on the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// networking-mode of the container. Note that =
containers with &quot;container&quot;<br>
+@@ -393,8 +394,8 @@ func setupPathsAndSandboxOptions(container *container.=
Container, cfg *config.Con<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*sboxOptions =3D ap=
pend(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*sboxOptions,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0libnetwork.OptionOriginHostsPath(&quot;/etc/hosts&quot;),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 libnetwork.OptionOriginResolvConfPath(&quot;/etc/resolv.conf&quot;),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 originResolvConfPath =3D=
 &quot;/etc/resolv.conf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case container.HostConfig.NetworkMode.IsUserDef=
ined():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// The container us=
es a user-defined network. We use the embedded DNS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// server for conta=
iner name resolution and to act as a DNS forwarder<br>
+@@ -407,10 +408,7 @@ func setupPathsAndSandboxOptions(container *container=
.Container, cfg *config.Con<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// If systemd-resol=
vd is used, the &quot;upstream&quot; DNS servers can be found in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// /run/systemd/res=
olve/resolv.conf. We do not query those DNS servers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// directly, as the=
y can be dynamically reconfigured.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *sboxOptions =3D append(=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *sboxOptions,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 libnetwork.OptionOriginResolvConfPath(&quot;/etc/resolv.conf&quot;),<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 originResolvConfPath =3D=
 &quot;/etc/resolv.conf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// For other situat=
ions, such as the default bridge network, container<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// discovery / name=
 resolution is handled through /etc/hosts, and no<br>
+@@ -423,11 +421,15 @@ func setupPathsAndSandboxOptions(container *containe=
r.Container, cfg *config.Con<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// DNS servers on t=
he host can be dynamically updated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Copy the host&#3=
9;s resolv.conf for the container (/run/systemd/resolve/resolv.conf or /etc=
/resolv.conf)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *sboxOptions =3D append(=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *sboxOptions,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 libnetwork.OptionOriginResolvConfPath(cfg.GetResolvConf()),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 originResolvConfPath =3D=
 cfg.GetResolvConf()<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Allow tests to point at their own resolv.conf fil=
e.<br>
++=C2=A0 =C2=A0 =C2=A0 if envPath :=3D os.Getenv(&quot;DOCKER_TEST_RESOLV_C=
ONF_PATH&quot;); envPath !=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.G(context.TODO()).In=
fof(&quot;Using OriginResolvConfPath from env: %s&quot;, envPath)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 originResolvConfPath =3D=
 envPath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 *sboxOptions =3D append(*sboxOptions, libnetwork.Opt=
ionOriginResolvConfPath(originResolvConfPath))<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0container.HostsPath, err =3D container.GetRootR=
esourcePath(&quot;hosts&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+diff --git a/integration/networking/resolvconf_test.go b/integration/netwo=
rking/resolvconf_test.go<br>
+new file mode 100644<br>
+index 0000000000..60c8b1bc9a<br>
+--- /dev/null<br>
++++ b/integration/networking/resolvconf_test.go<br>
+@@ -0,0 +1,142 @@<br>
++package networking<br>
++<br>
++import (<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;net&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;os&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;testing&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 containertypes &quot;<a href=3D"http://github.com/do=
cker/docker/api/types/container" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/docker/docker/api/types/container</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/docker/docker/int=
egration/internal/container" rel=3D"noreferrer" target=3D"_blank">github.co=
m/docker/docker/integration/internal/container</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/docker/docker/int=
egration/internal/network" rel=3D"noreferrer" target=3D"_blank">github.com/=
docker/docker/integration/internal/network</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/docker/docker/tes=
tutil/daemon" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker=
/testutil/daemon</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/miekg/dns" rel=3D=
"noreferrer" target=3D"_blank">github.com/miekg/dns</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;gotest.tools/v3/assert&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 is &quot;gotest.tools/v3/assert/cmp&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;gotest.tools/v3/skip&quot;<br>
++)<br>
++<br>
++// writeTempResolvConf writes a resolv.conf that only contains a single<b=
r>
++// nameserver line, with address addr.<br>
++// It returns the name of the temp file.<br>
++func writeTempResolvConf(t *testing.T, addr string) string {<br>
++=C2=A0 =C2=A0 =C2=A0 t.Helper()<br>
++=C2=A0 =C2=A0 =C2=A0 // Not using t.TempDir() here because in rootless mo=
de, while the temporary<br>
++=C2=A0 =C2=A0 =C2=A0 // directory gets mode 0777, it&#39;s a subdir of an=
 0700 directory owned by root.<br>
++=C2=A0 =C2=A0 =C2=A0 // So, it&#39;s not accessible by the daemon.<br>
++=C2=A0 =C2=A0 =C2=A0 f, err :=3D os.CreateTemp(&quot;&quot;, &quot;resolv=
.conf&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 t.Cleanup(func() { os.Remove(f.Name()) })<br>
++=C2=A0 =C2=A0 =C2=A0 err =3D f.Chmod(0644)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 f.Write([]byte(&quot;nameserver &quot; + addr + &quo=
t;\n&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 return f.Name()<br>
++}<br>
++<br>
++const dnsRespAddr =3D &quot;10.11.12.13&quot;<br>
++<br>
++// startDaftDNS starts and returns a really, really daft DNS server that =
only<br>
++// responds to type-A requests, and always with address dnsRespAddr.<br>
++func startDaftDNS(t *testing.T, addr string) *dns.Server {<br>
++=C2=A0 =C2=A0 =C2=A0 serveDNS :=3D func(w dns.ResponseWriter, query *dns.=
Msg) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if query.Question[0].Qty=
pe =3D=3D dns.TypeA {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp :=3D &amp;dns.Msg{}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp.SetReply(query)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 answer :=3D &amp;dns.A{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hdr: dns.RR_Header{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name:=C2=A0 =C2=
=A0query.Question[0].Name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Rrtype: dns.Typ=
eA,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Class:=C2=A0 dn=
s.ClassINET,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ttl:=C2=A0 =C2=
=A0 600,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 answer.A =3D net.ParseIP(dnsRespAddr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 resp.Answer =3D append(resp.Answer, answer)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 _ =3D w.WriteMsg(resp)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 conn, err :=3D net.ListenUDP(&quot;udp&quot;, &amp;n=
et.UDPAddr{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IP:=C2=A0 =C2=A0net.Pars=
eIP(addr),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Port: 53,<br>
++=C2=A0 =C2=A0 =C2=A0 })<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 server :=3D &amp;dns.Server{Handler: dns.HandlerFunc=
(serveDNS), PacketConn: conn}<br>
++=C2=A0 =C2=A0 =C2=A0 go func() {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D server.ActivateAnd=
Serve()<br>
++=C2=A0 =C2=A0 =C2=A0 }()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return server<br>
++}<br>
++<br>
++// Check that when a container is connected to an internal network, DNS<b=
r>
++// requests sent to daemon&#39;s internal DNS resolver are not forwarded =
to<br>
++// an upstream resolver listening on a localhost address.<br>
++// (Assumes the host does not already have a DNS server on 127.0.0.1.)<br=
>
++func TestInternalNetworkDNS(t *testing.T) {<br>
++=C2=A0 =C2=A0 =C2=A0 skip.If(t, testEnv.DaemonInfo.OSType =3D=3D &quot;wi=
ndows&quot;, &quot;No resolv.conf on Windows&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 skip.If(t, testEnv.IsRootless, &quot;Can&#39;t use r=
esolver on host in rootless mode&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 ctx :=3D setupTest(t)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Start a DNS server on the loopback interface.<br>
++=C2=A0 =C2=A0 =C2=A0 server :=3D startDaftDNS(t, &quot;127.0.0.1&quot;)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 defer server.Shutdown()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Set up a temp resolv.conf pointing at that DNS se=
rver, and a daemon using it.<br>
++=C2=A0 =C2=A0 =C2=A0 tmpFileName :=3D writeTempResolvConf(t, &quot;127.0.=
0.1&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 d :=3D daemon.New(t, daemon.WithEnvVars(&quot;DOCKER=
_TEST_RESOLV_CONF_PATH=3D&quot;+tmpFileName))<br>
++=C2=A0 =C2=A0 =C2=A0 d.StartWithBusybox(ctx, t, &quot;--experimental&quot=
;, &quot;--ip6tables&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 defer d.Stop(t)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 c :=3D d.NewClientT(t)<br>
++=C2=A0 =C2=A0 =C2=A0 defer c.Close()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 intNetName :=3D &quot;intnet&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 network.CreateNoError(ctx, t, c, intNetName,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network.WithDriver(&quot=
;bridge&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network.WithInternal(),<=
br>
++=C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 defer network.RemoveNoError(ctx, t, c, intNetName)<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 extNetName :=3D &quot;extnet&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 network.CreateNoError(ctx, t, c, extNetName,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network.WithDriver(&quot=
;bridge&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 defer network.RemoveNoError(ctx, t, c, extNetName)<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Create a container, initially with external conne=
ctivity.<br>
++=C2=A0 =C2=A0 =C2=A0 // Expect the external DNS server to respond to a re=
quest from the container.<br>
++=C2=A0 =C2=A0 =C2=A0 ctrId :=3D container.Run(ctx, t, c, container.WithNe=
tworkMode(extNetName))<br>
++=C2=A0 =C2=A0 =C2=A0 defer c.ContainerRemove(ctx, ctrId, containertypes.R=
emoveOptions{Force: true})<br>
++=C2=A0 =C2=A0 =C2=A0 res, err :=3D container.Exec(ctx, c, ctrId, []string=
{&quot;nslookup&quot;, &quot;test.example&quot;})<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.Check(t, is.Equal(res.ExitCode, 0))<br>
++=C2=A0 =C2=A0 =C2=A0 assert.Check(t, is.Contains(res.Stdout(), dnsRespAdd=
r))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Connect the container to the internal network as =
well.<br>
++=C2=A0 =C2=A0 =C2=A0 // External DNS should still be used.<br>
++=C2=A0 =C2=A0 =C2=A0 err =3D c.NetworkConnect(ctx, intNetName, ctrId, nil=
)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 res, err =3D container.Exec(ctx, c, ctrId, []string{=
&quot;nslookup&quot;, &quot;test.example&quot;})<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.Check(t, is.Equal(res.ExitCode, 0))<br>
++=C2=A0 =C2=A0 =C2=A0 assert.Check(t, is.Contains(res.Stdout(), dnsRespAdd=
r))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Disconnect from the external network.<br>
++=C2=A0 =C2=A0 =C2=A0 // Expect no access to the external DNS.<br>
++=C2=A0 =C2=A0 =C2=A0 err =3D c.NetworkDisconnect(ctx, extNetName, ctrId, =
true)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 res, err =3D container.Exec(ctx, c, ctrId, []string{=
&quot;nslookup&quot;, &quot;test.example&quot;})<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.Check(t, is.Equal(res.ExitCode, 1))<br>
++=C2=A0 =C2=A0 =C2=A0 assert.Check(t, is.Contains(res.Stdout(), &quot;SERV=
FAIL&quot;))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Reconnect the external network.<br>
++=C2=A0 =C2=A0 =C2=A0 // Check that the external DNS server is used again.=
<br>
++=C2=A0 =C2=A0 =C2=A0 err =3D c.NetworkConnect(ctx, extNetName, ctrId, nil=
)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 res, err =3D container.Exec(ctx, c, ctrId, []string{=
&quot;nslookup&quot;, &quot;test.example&quot;})<br>
++=C2=A0 =C2=A0 =C2=A0 assert.NilError(t, err)<br>
++=C2=A0 =C2=A0 =C2=A0 assert.Check(t, is.Equal(res.ExitCode, 0))<br>
++=C2=A0 =C2=A0 =C2=A0 assert.Check(t, is.Contains(res.Stdout(), dnsRespAdd=
r))<br>
++}<br>
+diff --git a/libnetwork/endpoint.go b/libnetwork/endpoint.go<br>
+index d9c257dc68..3ca546a4ac 100644<br>
+--- a/libnetwork/endpoint.go<br>
++++ b/libnetwork/endpoint.go<br>
+@@ -538,8 +538,13 @@ func (ep *Endpoint) sbJoin(sb *Sandbox, options ...En=
dpointOption) (err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sb.setupDefa=
ultGW()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 moveExtConn :=3D sb.getGatewayEndpoint() !=3D extEp<=
br>
++=C2=A0 =C2=A0 =C2=A0 currentExtEp :=3D sb.getGatewayEndpoint()<br>
++=C2=A0 =C2=A0 =C2=A0 // Enable upstream forwarding if the sandbox gained =
external connectivity.<br>
++=C2=A0 =C2=A0 =C2=A0 if sb.resolver !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sb.resolver.SetForwardin=
gPolicy(currentExtEp !=3D nil)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 moveExtConn :=3D currentExtEp !=3D extEp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if moveExtConn {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if extEp !=3D nil {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0log.G(context.TODO()).Debugf(&quot;Revoking external connectivity=
 on endpoint %s (%s)&quot;, extEp.Name(), extEp.ID())<br>
+@@ -735,6 +740,11 @@ func (ep *Endpoint) sbLeave(sb *Sandbox, force bool, =
options ...EndpointOption)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// New endpoint providing external connectivity=
 for the sandbox<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0extEp =3D sb.getGatewayEndpoint()<br>
++=C2=A0 =C2=A0 =C2=A0 // Disable upstream forwarding if the sandbox lost e=
xternal connectivity.<br>
++=C2=A0 =C2=A0 =C2=A0 if sb.resolver !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sb.resolver.SetForwardin=
gPolicy(extEp !=3D nil)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if moveExtConn &amp;&amp; extEp !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log.G(context.TODO(=
)).Debugf(&quot;Programming external connectivity on endpoint %s (%s)&quot;=
, extEp.Name(), extEp.ID())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extN, err :=3D extE=
p.getNetworkFromStore()<br>
+diff --git a/libnetwork/resolver.go b/libnetwork/resolver.go<br>
+index 9df2154499..5d5686fc86 100644<br>
+--- a/libnetwork/resolver.go<br>
++++ b/libnetwork/resolver.go<br>
+@@ -9,6 +9,7 @@ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strconv&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sync&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;sync/atomic&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;time&quot;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com/containerd/l=
og" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/log</a>&quot=
;<br>
+@@ -75,7 +76,7 @@ type Resolver struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tcpListen=C2=A0 =C2=A0 =C2=A0*net.TCPListener<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err=
or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0listenAddress string<br>
+-=C2=A0 =C2=A0 =C2=A0 proxyDNS=C2=A0 =C2=A0 =C2=A0 bool<br>
++=C2=A0 =C2=A0 =C2=A0 proxyDNS=C2=A0 =C2=A0 =C2=A0 atomic.Bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0startCh=C2=A0 =C2=A0 =C2=A0 =C2=A0chan struct{}=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0logger=C2=A0 =C2=A0 =C2=A0 =C2=A0 *log.Entry<br=
>
+ <br>
+@@ -85,15 +86,17 @@ type Resolver struct {<br>
+ <br>
+ // NewResolver creates a new instance of the Resolver<br>
+ func NewResolver(address string, proxyDNS bool, backend DNSBackend) *Reso=
lver {<br>
+-=C2=A0 =C2=A0 =C2=A0 return &amp;Resolver{<br>
++=C2=A0 =C2=A0 =C2=A0 r :=3D &amp;Resolver{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0backend,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proxyDNS:=C2=A0 =C2=A0 =
=C2=A0 proxyDNS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0listenAddress: addr=
ess,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Errorf(&quot;setup not done yet&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0startCh:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0make(chan struct{}, 1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwdSem:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 semaphore.NewWeighted(maxConcurrent),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logInverval:=C2=A0 =
=C2=A0rate.Sometimes{Interval: logInterval},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 r.proxyDNS.Store(proxyDNS)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return r<br>
+ }<br>
+ <br>
+ func (r *Resolver) log(ctx context.Context) *log.Entry {<br>
+@@ -194,6 +197,12 @@ func (r *Resolver) SetExtServers(extDNS []extDNSEntry=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
++// SetForwardingPolicy re-configures the embedded DNS resolver to either =
enable or disable forwarding DNS queries to<br>
++// external servers.<br>
++func (r *Resolver) SetForwardingPolicy(policy bool) {<br>
++=C2=A0 =C2=A0 =C2=A0 r.proxyDNS.Store(policy)<br>
++}<br>
++<br>
+ // NameServer returns the IP of the DNS resolver for the containers.<br>
+ func (r *Resolver) NameServer() string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return r.listenAddress<br>
+@@ -421,7 +430,7 @@ func (r *Resolver) serveDNS(w dns.ResponseWriter, quer=
y *dns.Msg) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if r.proxyDNS {<br>
++=C2=A0 =C2=A0 =C2=A0 if r.proxyDNS.Load() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// If the user sets=
 ndots &gt; 0 explicitly and the query is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// in the root doma=
in don&#39;t forward it out. We will return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// failure and let =
the client retry with the search domain<br>
+diff --git a/libnetwork/sandbox_dns_unix.go b/libnetwork/sandbox_dns_unix.=
go<br>
+index e30f394057..9f7a1c4671 100644<br>
+--- a/libnetwork/sandbox_dns_unix.go<br>
++++ b/libnetwork/sandbox_dns_unix.go<br>
+@@ -30,10 +30,11 @@ const (<br>
+ func (sb *Sandbox) startResolver(restore bool) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://sb.resolverOnce.Do" rel=3D"no=
referrer" target=3D"_blank">sb.resolverOnce.Do</a>(func() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var err error<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // The embedded resolver=
 is always started with proxyDNS set as true, even when the sandbox is only=
 attached to<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // an internal network. =
This way, it&#39;s the driver responsibility to make sure `connect` syscall=
 fails fast when<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // no external connectiv=
ity is available (eg. by not setting a default gateway).<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sb.resolver =3D NewResol=
ver(resolverIPSandbox, true, sb)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // The resolver is start=
ed with proxyDNS=3Dfalse if the sandbox does not currently<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // have a gateway. So, i=
f the Sandbox is only connected to an &#39;internal&#39; network,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // it will not forward D=
NS requests to external resolvers. The resolver&#39;s<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // proxyDNS setting is t=
hen updated as network Endpoints are added/removed.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sb.resolver =3D NewResol=
ver(resolverIPSandbox, sb.getGatewayEndpoint() !=3D nil, sb)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defer func() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sb.resolver =3D nil<br>
+-- <br>
+2.50.1<br>
+<br>
-- <br>
2.50.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9548): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9548" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9548</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117219699/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117219699/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000a825da064a09e9a3--

