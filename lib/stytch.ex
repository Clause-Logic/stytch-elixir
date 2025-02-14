defmodule Stytch do
  @moduledoc """
  Documentation for `Stytch`.
  """
  alias Stytch.Client

  # USERS

  @doc """
    See: https://stytch.com/docs/api/create-user
  """
  def create_user_by_email(config, email, opts \\ %{}) when is_binary(email) and is_map(opts) do
    "/users"
    |> Client.post(config, %{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/create-user
  """
  def create_user_by_phone_number(config, phone_number, opts \\ %{})
      when is_binary(phone_number) and is_map(opts) do
    "/users"
    |> Client.post(config, %{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/search-users
  """
  def search_users(config, opts \\ %{}) when is_map(opts) do
    "/users/search"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/api/get-user
  """
  def get_user(config, user_id) when is_binary(user_id) do
    "/users/#{user_id}"
    |> Client.get(config)
  end

  @doc """
    See: https://stytch.com/docs/api/update-user
  """
  def update_user(config, user_id, opts \\ %{}) when is_binary(user_id) and is_map(opts) do
    "/users/#{user_id}"
    |> Client.put(config, opts)
  end

  @doc """
    https://stytch.com/docs/api/delete-user
  """
  def delete_user(config, user_id) when is_binary(user_id) do
    "/users/#{user_id}"
    |> Client.delete(config)
  end

  @doc """
    See: https://stytch.com/docs/api/delete-user-email
  """
  def delete_user_email(config, email_id) when is_binary(email_id) do
    "/users/emails/#{email_id}"
    |> Client.delete(config)
  end

  @doc """
    See: https://stytch.com/docs/api/delete-user-phone-number
  """
  def delete_user_phone_number(config, phone_id) when is_binary(phone_id) do
    "/users/phone_numbers/#{phone_id}"
    |> Client.delete(config)
  end

  @doc """
    See: https://stytch.com/docs/api/delete-user-totp
  """
  def delete_user_totp(config, totp_id) when is_binary(totp_id) do
    "/users/totps/#{totp_id}"
    |> Client.delete(config)
  end

  @doc """
    See: https://stytch.com/docs/api/delete-user-password
  """
  def delete_user_password(config, password_id) when is_binary(password_id) do
    "/users/passwords/#{password_id}"
    |> Client.delete(config)
  end

  @doc """
    See: https://stytch.com/docs/api/get-pending-users
  """
  def get_pending_users(config, opts \\ %{}) when is_map(opts) do
    "/users/pending"
    |> Client.get(config, opts)
  end

  # MAGIC LINKS

  @doc """
    See: https://stytch.com/docs/api/send-by-email
  """
  def send_magic_link_by_email(config, email, opts \\ %{})
      when is_binary(email) and is_map(opts) do
    "/magic_links/email/send"
    |> Client.post(config, %{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/log-in-or-create-user-by-email
  """
  def login_or_create_user_by_email(config, email, opts \\ %{})
      when is_binary(email) and is_map(opts) do
    "/magic_links/email/login_or_create"
    |> Client.post(config, %{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/invite-by-email
  """
  def invite_user_by_email(config, email, opts \\ %{}) when is_binary(email) and is_map(opts) do
    "/magic_links/email/invite"
    |> Client.post(config, %{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/revoke-pending-invite
  """
  def revoke_pending_invite(config, email) when is_binary(email) do
    "/magic_links/email"
    |> Client.post(config, %{email: email})
  end

  @doc """
    See: https://stytch.com/docs/api/create-magic-link
  """
  def create_embeddable_magic_link(config, user_id, opts \\ %{})
      when is_binary(user_id) and is_map(opts) do
    "/magic_links"
    |> Client.post(config, %{user_id: user_id} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/authenticate-magic-link
  """
  def authenticate_magic_link(config, token, opts \\ %{})
      when is_binary(token) and is_map(opts) do
    "/magic_links/authenticate"
    |> Client.post(config, %{token: token} |> Map.merge(opts))
  end

  # ONE-TIME PASSCODES (OTP)

  @doc """
    See: https://stytch.com/docs/api/send-otp-by-sms
  """
  def send_otp_by_sms(config, phone_number, opts \\ %{})
      when is_binary(phone_number) and is_map(opts) do
    "/otps/sms/send"
    |> Client.post(config, %{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/log-in-or-create-user-by-sms
  """
  def login_or_create_user_by_sms(config, phone_number, opts \\ %{})
      when is_binary(phone_number) and is_map(opts) do
    "/otps/sms/login_or_create"
    |> Client.post(config, %{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/whatsapp-send
  """
  def send_otp_by_whatsapp(config, phone_number, opts \\ %{})
      when is_binary(phone_number) and is_map(opts) do
    "/otps/whatsapp/send"
    |> Client.post(config, %{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/log-in-or-create-user-by-whatsapp
  """
  def login_or_create_user_by_whatsapp(config, phone_number, opts \\ %{})
      when is_binary(phone_number) and is_map(opts) do
    "/otps/whatsapp/login_or_create"
    |> Client.post(config, %{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/email-send
  """
  def send_otp_by_email(config, email, opts \\ %{})
      when is_binary(email) and is_map(opts) do
    "/otps/email/send"
    |> Client.post(config, %{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/log-in-or-create-user-by-email
  """
  def login_or_create_user_by_email_otp(config, email, opts \\ %{})
      when is_binary(email) and is_map(opts) do
    "/otps/email/login_or_create"
    |> Client.post(config, %{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/authenticate-otp
  """
  def authenticate_otp(config, method_id, code, opts \\ %{})
      when is_binary(method_id) and is_binary(code) and is_map(opts) do
    "/otps/authenticate"
    |> Client.post(config, %{method_id: method_id, code: code} |> Map.merge(opts))
  end

  # OAUTH

  @doc """
    See: https://stytch.com/docs/api/oauth-overview
  """
  def start_oauth_url(config, provider, public_token, params \\ [])
      when is_binary(provider) and is_binary(public_token) and is_list(params) do
    "/public/oauth/#{provider}/start"
    |> Client.url(config, Keyword.merge([public_token: public_token], params))
  end

  @doc """
    See: https://stytch.com/docs/api/oauth-authenticate
  """
  def authenticate_oauth(config, token, opts \\ %{}) when is_binary(token) and is_map(opts) do
    "/oauth/authenticate"
    |> Client.post(config, %{token: token} |> Map.merge(opts))
  end

  # PASSWORDS

  @doc """
    See: https://stytch.com/docs/api/password-create
  """
  def create_user_with_password(config, email, password, opts \\ %{})
      when is_binary(email) and is_binary(password) and
             is_map(opts) do
    "/passwords"
    |> Client.post(config, %{email: email, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-authenticate
  """
  def authenticate_with_password(config, email, password, opts \\ %{})
      when is_binary(email) and is_binary(password) and is_map(opts) do
    "/passwords/authenticate"
    |> Client.post(config, %{email: email, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-email-reset-start
  """
  def initiate_reset_password_by_email(config, email, opts \\ %{})
      when is_binary(email) and is_map(opts) do
    "/passwords/email/reset/start"
    |> Client.post(config, %{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-email-reset
  """
  def reset_password_by_email(config, token, password, opts \\ %{})
      when is_binary(token) and is_binary(password) and is_map(opts) do
    "/passwords/email/reset"
    |> Client.post(config, %{token: token, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-existing-password-reset
  """
  def reset_password_by_existing(config, email, existing_password, new_password, opts \\ %{})
      when is_binary(email) and is_binary(existing_password) and is_binary(new_password) do
    "/passwords/existing_password/reset"
    |> Client.post(
      config,
      %{
        email: email,
        existing_password: existing_password,
        new_password: new_password
      }
      |> Map.merge(opts)
    )
  end

  @doc """
    See: https://stytch.com/docs/api/password-session-reset
  """
  def reset_password_by_session(config, session_token, password)
      when is_binary(session_token) and is_binary(password) do
    "/passwords/session/reset"
    |> Client.post(config, %{session_token: session_token, password: password})
  end

  @doc """
    See: https://stytch.com/docs/api/password-strength-check
  """
  def check_password_strength(config, password) when is_binary(password) do
    "/passwords/strength_check"
    |> Client.post(config, %{password: password})
  end

  # SESSION MANAGEMENT

  @doc """
    See: https://stytch.com/docs/api/jwks-get
  """
  def get_jwks(config, project_id) when is_binary(project_id) do
    "/sessions/jwks/#{project_id}"
    |> Client.get(config)
  end

  @doc """
    See: https://stytch.com/docs/api/session-get
  """
  def list_sessions(config, user_id) when is_binary(user_id) do
    "/sessions"
    |> Client.get(config, user_id: user_id)
  end

  @doc """
    See: https://stytch.com/docs/api/session-auth
  """
  def authenticate_session(config, session_token, opts \\ %{})
      when is_binary(session_token) and is_map(opts) do
    "/sessions/authenticate"
    |> Client.post(config, %{session_token: session_token} |> Map.merge(opts))
  end

  # authenticate_session_by_jwt
  # authenticate_session_by_token

  @doc """
    See: https://stytch.com/docs/api/session-revoke
  """
  def revoke_session(config, session_id) when is_binary(session_id) do
    "/sessions/revoke"
    |> Client.post(config, %{session_id: session_id})
  end

  # revoke_session_by_id
  # revoke_session_by_jwt
  # revoke_session_by_token

  # WEBAUTHN

  @doc """
    See: https://stytch.com/docs/api/webauthn-register-start
  """
  def start_webauthn_registration(config, user_id, domain, opts \\ %{})
      when is_binary(user_id) and is_binary(domain) and is_map(opts) do
    "/webauthn/register/start"
    |> Client.post(config, %{user_id: user_id, domain: domain} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/webauthn-register
  """
  def webauthn_registration(config, user_id, public_key_credential)
      when is_binary(user_id) and is_binary(public_key_credential) do
    "/webauthn/register"
    |> Client.post(config, %{user_id: user_id, public_key_credential: public_key_credential})
  end

  @doc """
    See: https://stytch.com/docs/api/webauthn-authenticate-start
  """
  def start_webauthn_authentication(config, user_id, domain)
      when is_binary(user_id) and is_binary(domain) do
    "/webauthn/authenticate/start"
    |> Client.post(config, %{user_id: user_id, domain: domain})
  end

  @doc """
    See: https://stytch.com/docs/api/webauthn-authenticate
  """
  def authenticate_webauthn(config, public_key_credential, opts \\ %{})
      when is_binary(public_key_credential) and is_map(opts) do
    "/webauthn/authenticate"
    |> Client.post(config, %{public_key_credential: public_key_credential} |> Map.merge(opts))
  end

  # TIME-BASED ONE-TIME PASSCODS (TOTP)

  @doc """
    See: https://stytch.com/docs/api/totp-create
  """
  def create_totp(config, user_id, opts \\ %{}) when is_binary(user_id) and is_map(opts) do
    "/totps"
    |> Client.post(config, %{user_id: user_id} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/totp-authenticate
  """
  def authenticate_totp(config, user_id, totp_code)
      when is_binary(user_id) and is_binary(totp_code) do
    "/totps/authenticate"
    |> Client.post(config, %{user_id: user_id, totp_code: totp_code})
  end

  @doc """
    See: https://stytch.com/docs/api/totp-get-recovery-codes
  """
  def get_totp_recovery_codes(config, user_id) when is_binary(user_id) do
    "/totps/recovery_codes"
    |> Client.post(config, %{user_id: user_id})
  end

  @doc """
    See: https://stytch.com/docs/api/totp-recover
  """
  def recover_totp(config, user_id, recovery_code, opts \\ %{})
      when is_binary(user_id) and is_binary(recovery_code) and is_map(opts) do
    "/totps/recover"
    |> Client.post(config, %{user_id: user_id, recovery_code: recovery_code} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-migrate
  """
  def migrate_password(config, email, hash, hash_type, opts \\ %{})
      when is_binary(email) and is_binary(hash) and is_binary(hash_type) and is_map(opts) do
    "/passwords/migrate"
    |> Client.post(config, %{email: email, hash: hash, hash_type: hash_type} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/create-organization
  """
  def b2b_create_organization(config, opts \\ %{}) when is_map(opts) do
    "/b2b/organizations"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/search-organizations
  """
  def b2b_search_organizations(config, opts \\ %{}) when is_map(opts) do
    "/b2b/organizations/search"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/email-reset-start
  """
  def b2b_email_password_reset_start(config, opts \\ %{}) when is_map(opts) do
    "/b2b/passwords/email/reset/start"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/email-reset-start
  """
  def b2b_email_password_reset(config, opts \\ %{}) when is_map(opts) do
    "/b2b/passwords/email/reset"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/authenticate-magic-link
  """
  def b2b_magic_link_authenticate(config, opts \\ %{}) when is_map(opts) do
    "/b2b/magic_links/authenticate"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/passwords-authenticate
  """
  def b2b_passwords_authenticate(config, opts \\ %{}) when is_map(opts) do
    "/b2b/passwords/authenticate"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/create-member
  """
  def b2b_create_member(config, org_id, opts \\ %{}) when is_map(opts) do
    "/b2b/organizations/#{org_id}/members"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/update-member
  """
  def b2b_update_member(config, org_id, member_id, opts \\ %{}) when is_map(opts) do
    "/b2b/organizations/#{org_id}/members/#{member_id}"
    |> Client.put(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/authenticate-session
  """
  def b2b_sessions_authenticate(config, opts \\ %{}) when is_map(opts) do
    "/b2b/sessions/authenticate"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/revoke-session
  """
  def b2b_sessions_reset(config, opts \\ %{}) when is_map(opts) do
    "/b2b/sessions/revoke"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/migrate
  """
  def b2b_passwords_migrate(config, opts \\ %{}) when is_map(opts) do
    "/b2b/passwords/migrate"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/session-reset
  """
  def b2b_passwords_sessions_reset(config, opts \\ %{}) when is_map(opts) do
    "/b2b/passwords/session/reset"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/strength-check
  """
  def b2b_passwords_strength_check(config, opts \\ %{}) when is_map(opts) do
    "/b2b/passwords/strength_check"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/get-m2m-token
  """
  def m2m_oauth_token(config, project_id, opts \\ %{}) when is_map(opts) do
    "/public/#{project_id}/oauth2/token"
    |> Client.post(config, opts)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/get-jwks
  """
  def b2b_sessions_jwks(config, project_id) when is_binary(project_id) do
    "/b2b/sessions/jwks/#{project_id}"
    |> Client.get(config)
  end

  @doc """
    See: https://stytch.com/docs/b2b/api/get-organization
  """
  def b2b_get_organization(config, org_id) when is_binary(org_id) do
    "/b2b/organizations/#{org_id}"
    |> Client.get(config)
  end
end
