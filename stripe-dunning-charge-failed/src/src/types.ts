// Generated via inngest init

export interface StripeChargeFailed {
  name: "stripe/charge.failed";
  data: {
    pending_webhooks: number;
    type: string;
    id: string;
    api_version: string;
    created: number;
    request: {
      id: string;
      idempotency_key: string;
    };
    object: string;
    data: {
      object: {
        description: string;
        invoice: string | null;
        order: string | null;
        refunds: {
          url: string;
          object: string;
          data: Array<unknown>;
          has_more: boolean;
          total_count: number;
        };
        review: string | null;
        statement_descriptor: unknown;
        application_fee_amount: unknown;
        billing_details: {
          address: {
            city: string | null;
            country: string | null;
            line1: string | null;
            line2: string | null;
            postal_code: string | null;
            state: string | null;
          };
          email: string | null;
          name: string | null;
          phone: string | null;
        };
        captured: boolean;
        paid: boolean;
        source: {
          country: string;
          last4: string;
          id: string;
          object: string;
          address_city: string | null;
          address_line2: string | null;
          address_state: string | null;
          address_zip_check: string | null;
          address_line1: string | null;
          cvc_check: string | null;
          dynamic_last4: string | null;
          exp_month: number;
          name: string | null;
          tokenization_method: string | null;
          address_line1_check: string | null;
          address_zip: string | null;
          customer: string | null;
          exp_year: number;
          fingerprint: string;
          metadata: {};
          address_country: string | null;
          brand: string;
          funding: string;
        };
        statement_descriptor_suffix: unknown;
        id: string;
        application_fee: unknown;
        destination: unknown;
        receipt_url: unknown;
        refunded: boolean;
        status: string;
        object: string;
        created: number;
        fraud_details: {};
        livemode: boolean;
        metadata: {};
        payment_method: string;
        receipt_number: unknown;
        currency: string;
        failure_balance_transaction: unknown;
        amount_refunded: number;
        calculated_statement_descriptor: string;
        outcome: {
          risk_score: number;
          seller_message: string;
          type: string;
          network_status: string;
          reason: string;
          risk_level: string;
        };
        payment_method_details: {
          card: {
            three_d_secure: unknown;
            brand: string;
            exp_year: number;
            installments: unknown;
            network: string;
            funding: string;
            last4: string;
            mandate: unknown;
            wallet: unknown;
            checks: {
              address_postal_code_check: unknown;
              cvc_check: unknown;
              address_line1_check: unknown;
            };
            country: string;
            exp_month: number;
            fingerprint: string;
          };
          type: string;
        };
        receipt_email: unknown;
        transfer_group: unknown;
        amount: number;
        amount_captured: number;
        on_behalf_of: unknown;
        customer: unknown;
        dispute: unknown;
        failure_message: string;
        payment_intent: unknown;
        transfer_data: unknown;
        application: unknown;
        balance_transaction: unknown;
        shipping: unknown;
        source_transfer: unknown;
        disputed: boolean;
        failure_code: string;
      };
    };
    livemode: boolean;
  };
  user: {
    email?: string;
  };
  v?: string;
  ts?: number;
};

export type EventTriggers = StripeChargeFailed;

export type Args = {
  event: EventTriggers;
  actions: {
    [clientID: string]: any
  };
};
